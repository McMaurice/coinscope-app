import 'dart:async';
import 'package:coinscope_app/src/models/ohlc_model.dart';
import 'package:coinscope_app/src/models/coin_model.dart';
import 'package:coinscope_app/src/services/api/api_client.dart';
import 'package:coinscope_app/src/services/api/api_service.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  var marketList = <CoinModel>[].obs;
  var candleDataList = <OhlcChartModel>[].obs;

  var isLoaded = false.obs;
  var isLoading = false.obs;
  var hasError = false.obs;

  late final ApiService _service;
  Timer? _marketTimer;
  final Map<String, DateTime> _lastOhlcFetch = {};

  DateTime? _lastMarketFetch;

  @override
  void onInit() {
    super.onInit();
    _service = ApiService(ApiClient());
    _fetchMarketsOnce();
    _marketTimer = Timer.periodic(Duration(seconds: 60), (_) {
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

  // Refresh markets with throttling
  Future<void> refreshMarkets() async {
    if (_lastMarketFetch != null &&
        DateTime.now().difference(_lastMarketFetch!).inSeconds < 60) {
      return;
    }
    _lastMarketFetch = DateTime.now();

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
    } catch (_) {}
  }

  // Full fetch markets (used on pull-to-refresh)
  Future<void> fetchMarkets() async {
    try {
      isLoading.value = true;
      hasError.value = false;

      final data = await _service.getMarkets();
      marketList.value = data;

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      hasError.value = true;
      marketList.clear();
    }
  }

  Future<void> fetchOhlcChart(String id, int days) async {
    final now = DateTime.now();
    if (_lastOhlcFetch[id] != null &&
        now.difference(_lastOhlcFetch[id]!).inSeconds < 60) {
      return;
    }

    _lastOhlcFetch[id] = now;

    try {
      isLoading.value = true;
      hasError.value = false;

      final data = await _service.getOhlcChart(id, days);
      candleDataList.value = data;

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      hasError.value = true;
      candleDataList.clear();
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
