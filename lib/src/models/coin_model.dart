import 'dart:convert';

class CoinModel {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double currentPrice;
  final double marketCap;
  final int marketCapRank;
  final double fullyDilutedValuation;
  final double totalVolume;
  final double priceChange24h;
  final double priceChangePercentage24h;
  final double circulatingSupply;
  final double totalSupply;
  final double maxSupply;

  CoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      id: json["id"] ?? '',
      symbol: json["symbol"] ?? '',
      name: json["name"] ?? '',
      image: json["image"] ?? '',
      currentPrice: (json["current_price"] ?? 0).toDouble(),
      marketCap: (json["market_cap"] ?? 0).toDouble(),
      marketCapRank: json["market_cap_rank"] ?? 0,
      fullyDilutedValuation: (json["fully_diluted_valuation"] ?? 0).toDouble(),
      totalVolume: (json["total_volume"] ?? 0).toDouble(),
      priceChange24h: (json["price_change_24h"] ?? 0).toDouble(),
      priceChangePercentage24h: (json["price_change_percentage_24h"] ?? 0)
          .toDouble(),
      circulatingSupply: (json["circulating_supply"] ?? 0).toDouble(),
      totalSupply: (json["total_supply"] ?? 0).toDouble(),
      maxSupply: (json["max_supply"] ?? 0).toDouble(),
    );
  }

  static List<CoinModel> listFromJson(String str) {
    final data = jsonDecode(str) as List<dynamic>;
    return data.map((item) => CoinModel.fromJson(item)).toList();
  }
}
