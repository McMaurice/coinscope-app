import 'dart:async';
import 'package:coinscope_app/src/data/local/database.dart';
import 'package:coinscope_app/src/models/ohlc_model.dart';
import 'package:coinscope_app/src/models/coin_model.dart';
import 'package:coinscope_app/src/services/api/api_client.dart';
import 'package:coinscope_app/src/services/api/api_service.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  var marketList = <CoinModel>[].obs;

  var dayChart = <OhlcChartModel>[].obs;
  var weekChart = <OhlcChartModel>[].obs;
  var monthsChart = <OhlcChartModel>[].obs;
  var trimesterChart = <OhlcChartModel>[].obs;
  var yearChart = <OhlcChartModel>[].obs;

  var isLoaded = false.obs;
  var isLoading = false.obs;
  var hasError = false.obs;

  late final ApiService _service;
  final AppDatabase localDb = AppDatabase();
  Timer? _marketTimer;
  final Map<String, DateTime> _lastOhlcFetch = {};

  DateTime? _lastTimeMarketUpdated;

  @override
  void onInit() {
    super.onInit();
    _service = ApiService(ApiClient());
    _fetchMarketsOnce();
    _marketTimer = Timer.periodic(Duration(seconds: 20), (_) {
      refreshMarkets();
    });
  }

  @override
  void onClose() {
    _marketTimer?.cancel();
    super.onClose();
  }

  // Fetch markets for the first time
  Future<void> _fetchMarketsOnce() async {
    await fetchMarkets();
  }

  //-- REFRESH AND UPDATES LOCAL DATABSE----
  Future<void> refreshMarkets() async {
    if (_lastTimeMarketUpdated != null &&
        DateTime.now().difference(_lastTimeMarketUpdated!).inSeconds < 20) {
      return;
    }

    try {
      final data = await _service.getMarkets();
      for (var coin in data) {
        final index = marketList.indexWhere((c) => c.id == coin.id);
        if (index != -1) {
          marketList[index] = coin;
        } else {
          marketList.add(coin);
        }
      }
      final companions = data.map((c) => c.toDb()).toList();
      await localDb.insertOrUpdateCoins(companions);
      _lastTimeMarketUpdated = DateTime.now();
      hasError.value = false;
    } catch (_) {}
  }

  // -- FETCHES MARKET FROM API RESULTS OR LOCAL DATA BASE ----
  Future<void> fetchMarkets() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final data = await _service.getMarkets();
      marketList.value = data;
      final companions = data.map((c) => c.toDb()).toList();
      await localDb.insertOrUpdateCoins(companions);
      isLoading.value = false;
    } catch (e) {
      final data = await localDb.getAllCoins();
      final mapped = data.map((e) => CoinModel.fromDb(e)).toList();
      marketList.assignAll(mapped);
      isLoading.value = false;
      hasError.value = true;
    }
  }

  Future<void> fetchOhlcCharts(String id) async {
    final now = DateTime.now();
    if (_lastOhlcFetch[id] != null &&
        now.difference(_lastOhlcFetch[id]!).inSeconds < 20) {
      return;
    }
    _lastOhlcFetch[id] = now;

    try {
      isLoading.value = true;
      hasError.value = false;

      // Run all API calls in parallel
      final results = await Future.wait([
        _service.getOhlcChart(id, 1).catchError((_) => <OhlcChartModel>[]),
        _service.getOhlcChart(id, 7).catchError((_) => <OhlcChartModel>[]),
        _service.getOhlcChart(id, 30).catchError((_) => <OhlcChartModel>[]),
        _service.getOhlcChart(id, 90).catchError((_) => <OhlcChartModel>[]),
        _service.getOhlcChart(id, 365).catchError((_) => <OhlcChartModel>[]),
      ]);

      dayChart.value = results[0];
      weekChart.value = results[1];
      monthsChart.value = results[2];
      trimesterChart.value = results[3];
      yearChart.value = results[4];

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      hasError.value = true;
    }
  }

  double getMinLow(List<OhlcChartModel> data) {
    if (data.isEmpty) return 0;
    return data.map((e) => e.low).reduce((a, b) => a < b ? a : b);
  }

  double getMaxHigh(List<OhlcChartModel> data) {
    if (data.isEmpty) return 0;
    return data.map((e) => e.high).reduce((a, b) => a > b ? a : b);
  }
}
