import 'dart:convert';

class CoinModel {
  String id;
  String name;
  String symbol;
  String image;
  double currentPrice;
  int marketCap;
  int marketCapRank;
  double marketCapChangePercentage24H;

  CoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.marketCapChangePercentage24H,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) => CoinModel(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    image: json["image"],
    currentPrice: json["current_price"]?.toDouble() ?? 0,
    marketCap: json["market_cap"] ?? 0,
    marketCapRank: json["market_cap_rank"] ?? 0,
    marketCapChangePercentage24H:
        json["market_cap_change_percentage_24h"]?.toDouble() ?? 0,
  );

  //---- DECODES THE JSON INTO DART DATA -------
  static List<CoinModel> listFromJson(String str) {
    final data = jsonDecode(str) as List<dynamic>;
    return data.map((item) => CoinModel.fromJson(item)).toList();
  }
}
