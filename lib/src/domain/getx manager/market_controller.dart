import 'package:coinscope_app/src/models/ohlc_model.dart';
import 'package:coinscope_app/src/models/coin_model.dart';
import 'package:coinscope_app/src/services/api/api_client.dart';
import 'package:coinscope_app/src/services/api/api_service.dart';
import 'package:get/get.dart';

// ----- SUPPLIES DATA FROM API SERVICE TO THE UI AND DB ---
class AppController extends GetxController {
  var marketList = <CoinModel>[].obs;
  var candleDataList = <OhlcChartModel>[].obs;

  var isLoaded = false.obs;
  var isLoading = false.obs;
  var hasError = false.obs;

  late final ApiService _service;

  @override
  void onInit() {
    super.onInit();
    _service = ApiService(ApiClient());
    fetchMarkets();
  }

  Future<void> refreshMarkets() async {
    await fetchMarkets();
  }

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

  // Call this to fetch candlestick data
  Future<void> fetchOhlcChart(String id, int days) async {
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
    final min = data.map((e) => e.low).reduce((a, b) => a < b ? a : b);
    return min;
  }

  double getMaxHigh(List<OhlcChartModel> data) {
    if (data.isEmpty) return 0;
    final max = data.map((e) => e.high).reduce((a, b) => a > b ? a : b);
    return max;
  }
}
