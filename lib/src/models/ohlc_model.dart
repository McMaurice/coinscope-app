import 'dart:convert';

class OhlcChartModel {
  final int timestamp;
  final double open;
  final double high;
  final double low;
  final double close;

  OhlcChartModel({
    required this.timestamp,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  factory OhlcChartModel.fromList(List<dynamic> list) {
    return OhlcChartModel(
      timestamp: list[0] as int,
      open: (list[1] as num).toDouble(),
      high: (list[2] as num).toDouble(),
      low: (list[3] as num).toDouble(),
      close: (list[4] as num).toDouble(),
    );
  }

  // Convert the whole API response string to a list of CandleDataModel
  static List<OhlcChartModel> listFromJson(String str) {
    final data = jsonDecode(str) as List<dynamic>;
    return data.map((item) => OhlcChartModel.fromList(item)).toList();
  }
}
