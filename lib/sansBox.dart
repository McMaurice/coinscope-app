// import 'dart:async';
// import 'package:coinscope_app/src/data/local/database.dart';
// import 'package:coinscope_app/src/data/local/database.dart' as drift;
// import 'package:coinscope_app/src/models/ohlc_model.dart';
// import 'package:coinscope_app/src/models/coin_model.dart';
// import 'package:coinscope_app/src/services/api/api_client.dart';
// import 'package:coinscope_app/src/services/api/api_service.dart';
// import 'package:drift/drift.dart' as drift;
// import 'package:get/get.dart';

// class AppController extends GetxController {
//   var marketList = <CoinModel>[].obs;
//   var candleDataList = <OhlcChartModel>[].obs;

//   var isLoaded = false.obs;
//   var isLoading = false.obs;
//   var hasError = false.obs;

//   late final ApiService _apiService;
//   late final AppDatabase _db;

//   Timer? _marketTimer;
//   final Map<String, DateTime> _lastOhlcFetch = {};
//   DateTime? _lastMarketFetch;

//   @override
//   void onInit() {
//     super.onInit();
//     _apiService = ApiService(ApiClient());
//     _db = AppDatabase();
//     _fetchMarketsOnce();
//     _marketTimer = Timer.periodic(Duration(seconds: 60), (_) {
//       refreshMarkets();
//     });
//   }

//   @override
//   void onClose() {
//     _marketTimer?.cancel();
//     super.onClose();
//   }

//   Future<void> _fetchMarketsOnce() async {
//     await fetchMarkets();
//   }

//   Future<void> refreshMarkets() async {
//     if (_lastMarketFetch != null &&
//         DateTime.now().difference(_lastMarketFetch!).inSeconds < 60) {
//       return;
//     }
//     _lastMarketFetch = DateTime.now();
//     await fetchMarkets();
//   }

//   Future<void> fetchMarkets() async {
//     isLoading.value = true;
//     hasError.value = false;

//     try {
//       final data = await _apiService.getMarkets();

//       if (data.isNotEmpty) {
//         // Update local Drift database
//         for (var coin in data) {
//           final existing = await _db.getCoinById(coin.id);
//           if (existing != null) {
//             await (_db.update(
//               _db.coinsEntity,
//             )..where((tbl) => tbl.id.equals(coin.id))).write(
//               drift.CoinsEntityCompanion(
//                 name: drift.Value(coin.name),
//                 symbol: drift.Value(coin.symbol),
//                 image: drift.Value(coin.image),
//                 currentPrice: drift.Value(coin.currentPrice),
//                 marketCap: drift.Value(coin.marketCap),
//                 marketCapRank: drift.Value(coin.marketCapRank),
//                 totalVolume: drift.Value(coin.totalVolume),
//                 fullyDilutedValuation: drift.Value(coin.fullyDilutedValuation),
//                 circulatingSupply: drift.Value(coin.circulatingSupply),
//                 priceChange24h: drift.Value(coin.priceChange24h),
//                 totalSupply: drift.Value(coin.totalSupply),
//                 maxSupply: drift.Value(coin.maxSupply),
//                 priceChangePercentage24h: drift.Value(
//                   coin.priceChangePercentage24h,
//                 ),
//               ),
//             );
//           } else {
//             await _db
//                 .into(_db.coinsEntity)
//                 .insert(
//                   CoinsEntityCompanion.insert(
//                     id: coin.id,
//                     name: coin.name,
//                     symbol: coin.symbol,
//                     image: coin.image,
//                     currentPrice: coin.currentPrice,
//                     marketCap: coin.marketCap,
//                     marketCapRank: coin.marketCapRank,
//                     totalVolume: coin.totalVolume,
//                     fullyDilutedValuation: coin.fullyDilutedValuation,
//                     circulatingSupply: coin.circulatingSupply,
//                     priceChange24h: coin.priceChange24h,
//                     totalSupply: coin.totalSupply,
//                     maxSupply: coin.maxSupply,
//                     priceChangePercentage24h: coin.priceChangePercentage24h,
//                   ),
//                 );
//           }
//         }

//         marketList.value = data;
//         isLoaded.value = true;
//       } else {
//         await _loadLocalCoins();
//       }
//       isLoading.value = false;
//     } catch (e) {
//       await _loadLocalCoins();
//       isLoading.value = false;
//       hasError.value = marketList.isEmpty;
//     }
//   }

//   Future<void> _loadLocalCoins() async {
//     try {
//       final localCoins = await _db.getAllCoins();
//       if (localCoins.isNotEmpty) {
//         marketList.value = localCoins
//             .map(
//               (e) => CoinModel(
//                 id: e.id,
//                 symbol: e.symbol,
//                 name: e.name,
//                 image: e.image,
//                 currentPrice: e.currentPrice,
//                 marketCap: e.marketCap,
//                 marketCapRank: e.marketCapRank,
//                 totalVolume: e.totalVolume,
//                 fullyDilutedValuation: e.fullyDilutedValuation,
//                 circulatingSupply: e.circulatingSupply,
//                 priceChange24h: e.priceChange24h,
//                 totalSupply: e.totalSupply,
//                 maxSupply: e.maxSupply,
//                 priceChangePercentage24h: e.priceChangePercentage24h,
//               ),
//             )
//             .toList();
//         isLoaded.value = true;
//       } else {
//         hasError.value = true;
//       }
//     } catch (e) {
//       hasError.value = true;
//     }
//   }

//   Future<void> fetchOhlcChart(String id, int days) async {
//     final now = DateTime.now();
//     if (_lastOhlcFetch[id] != null &&
//         now.difference(_lastOhlcFetch[id]!).inSeconds < 60) {
//       return;
//     }

//     _lastOhlcFetch[id] = now;

//     try {
//       isLoading.value = true;
//       hasError.value = false;

//       final data = await _apiService.getOhlcChart(id, days);
//       candleDataList.value = data;

//       isLoading.value = false;
//     } catch (e) {
//       isLoading.value = false;
//       hasError.value = true;
//       candleDataList.clear();
//     }
//   }

//   double getMinLow(List<OhlcChartModel> data) {
//     if (data.isEmpty) return 0;
//     return data.map((e) => e.low).reduce((a, b) => a < b ? a : b);
//   }

//   double getMaxHigh(List<OhlcChartModel> data) {
//     if (data.isEmpty) return 0;
//     return data.map((e) => e.high).reduce((a, b) => a > b ? a : b);
//   }
// }
