import 'package:drift/drift.dart';

class CoinsEntity extends Table {
  TextColumn get id => text()(); // primary key
  TextColumn get symbol => text().named('symbol')();
  TextColumn get name => text().named('name')();
  RealColumn get currentPrice => real().named('current_price')();
  RealColumn get marketCap => real().named('market_cap')();
  IntColumn get marketCapRank => integer().named('market_cap_rank')();
  RealColumn get totalVolume => real().named('total_volume')();

  RealColumn get fullyDilutedValuation =>
      real().named('fully_diluted_valuation')();
  RealColumn get circulatingSupply => real().named('circulating_supply')();
  RealColumn get priceChange24h => real().named('price_change_24h')();
  RealColumn get totalSupply => real().named('total_supply')();
  RealColumn get maxSupply => real().named('max_supply')();
  RealColumn get priceChangePercentage24h =>
      real().named('price_change_percentage_24h')();
  TextColumn get image => text().named('image_url')();

  @override
  Set<Column> get primaryKey => {id};
}
