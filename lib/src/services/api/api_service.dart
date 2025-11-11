import 'package:coinscope_app/src/models/ohlc_model.dart';
import 'package:coinscope_app/src/models/coin_model.dart';
import 'package:coinscope_app/src/services/api/api_client.dart';
import 'package:coinscope_app/src/services/api/api_constants.dart';

//--- API CALLS -----
class ApiService {
  ApiService(this.client);
  final ApiClient client;

  Future<List<CoinModel>> getMarkets() async {
    final dataString = await client.get(ApiConstants.marketListEndpoint);
    //--- RETURNS THE DATA INTO THE MODEL -----
    return CoinModel.listFromJson(dataString);
  }

  Future<List<OhlcChartModel>> getOhlcChart(String id, int days) async {
    final dataString = await client.get(
      ApiConstants.ohlcEndpoint(id),
      queryParams: {'days': days.toString()},
    );

    return OhlcChartModel.listFromJson(dataString);
  }
}
