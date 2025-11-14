import 'dart:io';
import 'package:coinscope_app/src/models/coins_db_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

// Opens or creates the database file

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/coinScope.sqlite');

   // Uncomment to reset DB when schema changes
    // if (await file.exists()) {
    //   await file.delete();
    // }

    return NativeDatabase(
      file,
      logStatements: false, // set to true for debugging
    );
  });
}

@DriftDatabase(tables: [CoinsEntity])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Get all coins from database
  Future<List<CoinsEntityData>> getAllCoins() => select(coinsEntity).get();

  // Get single coin by ID
  Future<CoinsEntityData?> getCoinById(String id) {
    return (select(
      coinsEntity,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  // Batch insert or replace coins
  Future<void> insertOrUpdateCoins(List<CoinsEntityCompanion> coins) async {
    if (coins.isEmpty) return;

    await batch((batch) {
      batch.insertAll(
        coinsEntity,
        coins,
        mode: InsertMode.insertOrReplace, // replaces if primary key exists
      );
    });
  }
}
