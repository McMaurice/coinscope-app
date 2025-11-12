// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CoinsEntityTable extends CoinsEntity
    with TableInfo<$CoinsEntityTable, CoinsEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoinsEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
    'symbol',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentPriceMeta = const VerificationMeta(
    'currentPrice',
  );
  @override
  late final GeneratedColumn<double> currentPrice = GeneratedColumn<double>(
    'current_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _marketCapMeta = const VerificationMeta(
    'marketCap',
  );
  @override
  late final GeneratedColumn<double> marketCap = GeneratedColumn<double>(
    'market_cap',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _marketCapRankMeta = const VerificationMeta(
    'marketCapRank',
  );
  @override
  late final GeneratedColumn<int> marketCapRank = GeneratedColumn<int>(
    'market_cap_rank',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalVolumeMeta = const VerificationMeta(
    'totalVolume',
  );
  @override
  late final GeneratedColumn<double> totalVolume = GeneratedColumn<double>(
    'total_volume',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullyDilutedValuationMeta =
      const VerificationMeta('fullyDilutedValuation');
  @override
  late final GeneratedColumn<double> fullyDilutedValuation =
      GeneratedColumn<double>(
        'fully_diluted_valuation',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _circulatingSupplyMeta = const VerificationMeta(
    'circulatingSupply',
  );
  @override
  late final GeneratedColumn<double> circulatingSupply =
      GeneratedColumn<double>(
        'circulating_supply',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _priceChange24hMeta = const VerificationMeta(
    'priceChange24h',
  );
  @override
  late final GeneratedColumn<double> priceChange24h = GeneratedColumn<double>(
    'price_change_24h',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalSupplyMeta = const VerificationMeta(
    'totalSupply',
  );
  @override
  late final GeneratedColumn<double> totalSupply = GeneratedColumn<double>(
    'total_supply',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maxSupplyMeta = const VerificationMeta(
    'maxSupply',
  );
  @override
  late final GeneratedColumn<double> maxSupply = GeneratedColumn<double>(
    'max_supply',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceChangePercentage24hMeta =
      const VerificationMeta('priceChangePercentage24h');
  @override
  late final GeneratedColumn<double> priceChangePercentage24h =
      GeneratedColumn<double>(
        'price_change_percentage_24h',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    symbol,
    name,
    currentPrice,
    marketCap,
    marketCapRank,
    totalVolume,
    fullyDilutedValuation,
    circulatingSupply,
    priceChange24h,
    totalSupply,
    maxSupply,
    priceChangePercentage24h,
    image,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'coins_entity';
  @override
  VerificationContext validateIntegrity(
    Insertable<CoinsEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(
        _symbolMeta,
        symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta),
      );
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('current_price')) {
      context.handle(
        _currentPriceMeta,
        currentPrice.isAcceptableOrUnknown(
          data['current_price']!,
          _currentPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentPriceMeta);
    }
    if (data.containsKey('market_cap')) {
      context.handle(
        _marketCapMeta,
        marketCap.isAcceptableOrUnknown(data['market_cap']!, _marketCapMeta),
      );
    } else if (isInserting) {
      context.missing(_marketCapMeta);
    }
    if (data.containsKey('market_cap_rank')) {
      context.handle(
        _marketCapRankMeta,
        marketCapRank.isAcceptableOrUnknown(
          data['market_cap_rank']!,
          _marketCapRankMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_marketCapRankMeta);
    }
    if (data.containsKey('total_volume')) {
      context.handle(
        _totalVolumeMeta,
        totalVolume.isAcceptableOrUnknown(
          data['total_volume']!,
          _totalVolumeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalVolumeMeta);
    }
    if (data.containsKey('fully_diluted_valuation')) {
      context.handle(
        _fullyDilutedValuationMeta,
        fullyDilutedValuation.isAcceptableOrUnknown(
          data['fully_diluted_valuation']!,
          _fullyDilutedValuationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fullyDilutedValuationMeta);
    }
    if (data.containsKey('circulating_supply')) {
      context.handle(
        _circulatingSupplyMeta,
        circulatingSupply.isAcceptableOrUnknown(
          data['circulating_supply']!,
          _circulatingSupplyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_circulatingSupplyMeta);
    }
    if (data.containsKey('price_change_24h')) {
      context.handle(
        _priceChange24hMeta,
        priceChange24h.isAcceptableOrUnknown(
          data['price_change_24h']!,
          _priceChange24hMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_priceChange24hMeta);
    }
    if (data.containsKey('total_supply')) {
      context.handle(
        _totalSupplyMeta,
        totalSupply.isAcceptableOrUnknown(
          data['total_supply']!,
          _totalSupplyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalSupplyMeta);
    }
    if (data.containsKey('max_supply')) {
      context.handle(
        _maxSupplyMeta,
        maxSupply.isAcceptableOrUnknown(data['max_supply']!, _maxSupplyMeta),
      );
    } else if (isInserting) {
      context.missing(_maxSupplyMeta);
    }
    if (data.containsKey('price_change_percentage_24h')) {
      context.handle(
        _priceChangePercentage24hMeta,
        priceChangePercentage24h.isAcceptableOrUnknown(
          data['price_change_percentage_24h']!,
          _priceChangePercentage24hMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_priceChangePercentage24hMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image_url']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CoinsEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CoinsEntityData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      symbol: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}symbol'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      currentPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_price'],
      )!,
      marketCap: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}market_cap'],
      )!,
      marketCapRank: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}market_cap_rank'],
      )!,
      totalVolume: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_volume'],
      )!,
      fullyDilutedValuation: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fully_diluted_valuation'],
      )!,
      circulatingSupply: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}circulating_supply'],
      )!,
      priceChange24h: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_change_24h'],
      )!,
      totalSupply: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_supply'],
      )!,
      maxSupply: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}max_supply'],
      )!,
      priceChangePercentage24h: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price_change_percentage_24h'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
    );
  }

  @override
  $CoinsEntityTable createAlias(String alias) {
    return $CoinsEntityTable(attachedDatabase, alias);
  }
}

class CoinsEntityData extends DataClass implements Insertable<CoinsEntityData> {
  final String id;
  final String symbol;
  final String name;
  final double currentPrice;
  final double marketCap;
  final int marketCapRank;
  final double totalVolume;
  final double fullyDilutedValuation;
  final double circulatingSupply;
  final double priceChange24h;
  final double totalSupply;
  final double maxSupply;
  final double priceChangePercentage24h;
  final String image;
  const CoinsEntityData({
    required this.id,
    required this.symbol,
    required this.name,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.totalVolume,
    required this.fullyDilutedValuation,
    required this.circulatingSupply,
    required this.priceChange24h,
    required this.totalSupply,
    required this.maxSupply,
    required this.priceChangePercentage24h,
    required this.image,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['symbol'] = Variable<String>(symbol);
    map['name'] = Variable<String>(name);
    map['current_price'] = Variable<double>(currentPrice);
    map['market_cap'] = Variable<double>(marketCap);
    map['market_cap_rank'] = Variable<int>(marketCapRank);
    map['total_volume'] = Variable<double>(totalVolume);
    map['fully_diluted_valuation'] = Variable<double>(fullyDilutedValuation);
    map['circulating_supply'] = Variable<double>(circulatingSupply);
    map['price_change_24h'] = Variable<double>(priceChange24h);
    map['total_supply'] = Variable<double>(totalSupply);
    map['max_supply'] = Variable<double>(maxSupply);
    map['price_change_percentage_24h'] = Variable<double>(
      priceChangePercentage24h,
    );
    map['image_url'] = Variable<String>(image);
    return map;
  }

  CoinsEntityCompanion toCompanion(bool nullToAbsent) {
    return CoinsEntityCompanion(
      id: Value(id),
      symbol: Value(symbol),
      name: Value(name),
      currentPrice: Value(currentPrice),
      marketCap: Value(marketCap),
      marketCapRank: Value(marketCapRank),
      totalVolume: Value(totalVolume),
      fullyDilutedValuation: Value(fullyDilutedValuation),
      circulatingSupply: Value(circulatingSupply),
      priceChange24h: Value(priceChange24h),
      totalSupply: Value(totalSupply),
      maxSupply: Value(maxSupply),
      priceChangePercentage24h: Value(priceChangePercentage24h),
      image: Value(image),
    );
  }

  factory CoinsEntityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CoinsEntityData(
      id: serializer.fromJson<String>(json['id']),
      symbol: serializer.fromJson<String>(json['symbol']),
      name: serializer.fromJson<String>(json['name']),
      currentPrice: serializer.fromJson<double>(json['currentPrice']),
      marketCap: serializer.fromJson<double>(json['marketCap']),
      marketCapRank: serializer.fromJson<int>(json['marketCapRank']),
      totalVolume: serializer.fromJson<double>(json['totalVolume']),
      fullyDilutedValuation: serializer.fromJson<double>(
        json['fullyDilutedValuation'],
      ),
      circulatingSupply: serializer.fromJson<double>(json['circulatingSupply']),
      priceChange24h: serializer.fromJson<double>(json['priceChange24h']),
      totalSupply: serializer.fromJson<double>(json['totalSupply']),
      maxSupply: serializer.fromJson<double>(json['maxSupply']),
      priceChangePercentage24h: serializer.fromJson<double>(
        json['priceChangePercentage24h'],
      ),
      image: serializer.fromJson<String>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'symbol': serializer.toJson<String>(symbol),
      'name': serializer.toJson<String>(name),
      'currentPrice': serializer.toJson<double>(currentPrice),
      'marketCap': serializer.toJson<double>(marketCap),
      'marketCapRank': serializer.toJson<int>(marketCapRank),
      'totalVolume': serializer.toJson<double>(totalVolume),
      'fullyDilutedValuation': serializer.toJson<double>(fullyDilutedValuation),
      'circulatingSupply': serializer.toJson<double>(circulatingSupply),
      'priceChange24h': serializer.toJson<double>(priceChange24h),
      'totalSupply': serializer.toJson<double>(totalSupply),
      'maxSupply': serializer.toJson<double>(maxSupply),
      'priceChangePercentage24h': serializer.toJson<double>(
        priceChangePercentage24h,
      ),
      'image': serializer.toJson<String>(image),
    };
  }

  CoinsEntityData copyWith({
    String? id,
    String? symbol,
    String? name,
    double? currentPrice,
    double? marketCap,
    int? marketCapRank,
    double? totalVolume,
    double? fullyDilutedValuation,
    double? circulatingSupply,
    double? priceChange24h,
    double? totalSupply,
    double? maxSupply,
    double? priceChangePercentage24h,
    String? image,
  }) => CoinsEntityData(
    id: id ?? this.id,
    symbol: symbol ?? this.symbol,
    name: name ?? this.name,
    currentPrice: currentPrice ?? this.currentPrice,
    marketCap: marketCap ?? this.marketCap,
    marketCapRank: marketCapRank ?? this.marketCapRank,
    totalVolume: totalVolume ?? this.totalVolume,
    fullyDilutedValuation: fullyDilutedValuation ?? this.fullyDilutedValuation,
    circulatingSupply: circulatingSupply ?? this.circulatingSupply,
    priceChange24h: priceChange24h ?? this.priceChange24h,
    totalSupply: totalSupply ?? this.totalSupply,
    maxSupply: maxSupply ?? this.maxSupply,
    priceChangePercentage24h:
        priceChangePercentage24h ?? this.priceChangePercentage24h,
    image: image ?? this.image,
  );
  CoinsEntityData copyWithCompanion(CoinsEntityCompanion data) {
    return CoinsEntityData(
      id: data.id.present ? data.id.value : this.id,
      symbol: data.symbol.present ? data.symbol.value : this.symbol,
      name: data.name.present ? data.name.value : this.name,
      currentPrice: data.currentPrice.present
          ? data.currentPrice.value
          : this.currentPrice,
      marketCap: data.marketCap.present ? data.marketCap.value : this.marketCap,
      marketCapRank: data.marketCapRank.present
          ? data.marketCapRank.value
          : this.marketCapRank,
      totalVolume: data.totalVolume.present
          ? data.totalVolume.value
          : this.totalVolume,
      fullyDilutedValuation: data.fullyDilutedValuation.present
          ? data.fullyDilutedValuation.value
          : this.fullyDilutedValuation,
      circulatingSupply: data.circulatingSupply.present
          ? data.circulatingSupply.value
          : this.circulatingSupply,
      priceChange24h: data.priceChange24h.present
          ? data.priceChange24h.value
          : this.priceChange24h,
      totalSupply: data.totalSupply.present
          ? data.totalSupply.value
          : this.totalSupply,
      maxSupply: data.maxSupply.present ? data.maxSupply.value : this.maxSupply,
      priceChangePercentage24h: data.priceChangePercentage24h.present
          ? data.priceChangePercentage24h.value
          : this.priceChangePercentage24h,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CoinsEntityData(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('currentPrice: $currentPrice, ')
          ..write('marketCap: $marketCap, ')
          ..write('marketCapRank: $marketCapRank, ')
          ..write('totalVolume: $totalVolume, ')
          ..write('fullyDilutedValuation: $fullyDilutedValuation, ')
          ..write('circulatingSupply: $circulatingSupply, ')
          ..write('priceChange24h: $priceChange24h, ')
          ..write('totalSupply: $totalSupply, ')
          ..write('maxSupply: $maxSupply, ')
          ..write('priceChangePercentage24h: $priceChangePercentage24h, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    symbol,
    name,
    currentPrice,
    marketCap,
    marketCapRank,
    totalVolume,
    fullyDilutedValuation,
    circulatingSupply,
    priceChange24h,
    totalSupply,
    maxSupply,
    priceChangePercentage24h,
    image,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoinsEntityData &&
          other.id == this.id &&
          other.symbol == this.symbol &&
          other.name == this.name &&
          other.currentPrice == this.currentPrice &&
          other.marketCap == this.marketCap &&
          other.marketCapRank == this.marketCapRank &&
          other.totalVolume == this.totalVolume &&
          other.fullyDilutedValuation == this.fullyDilutedValuation &&
          other.circulatingSupply == this.circulatingSupply &&
          other.priceChange24h == this.priceChange24h &&
          other.totalSupply == this.totalSupply &&
          other.maxSupply == this.maxSupply &&
          other.priceChangePercentage24h == this.priceChangePercentage24h &&
          other.image == this.image);
}

class CoinsEntityCompanion extends UpdateCompanion<CoinsEntityData> {
  final Value<String> id;
  final Value<String> symbol;
  final Value<String> name;
  final Value<double> currentPrice;
  final Value<double> marketCap;
  final Value<int> marketCapRank;
  final Value<double> totalVolume;
  final Value<double> fullyDilutedValuation;
  final Value<double> circulatingSupply;
  final Value<double> priceChange24h;
  final Value<double> totalSupply;
  final Value<double> maxSupply;
  final Value<double> priceChangePercentage24h;
  final Value<String> image;
  final Value<int> rowid;
  const CoinsEntityCompanion({
    this.id = const Value.absent(),
    this.symbol = const Value.absent(),
    this.name = const Value.absent(),
    this.currentPrice = const Value.absent(),
    this.marketCap = const Value.absent(),
    this.marketCapRank = const Value.absent(),
    this.totalVolume = const Value.absent(),
    this.fullyDilutedValuation = const Value.absent(),
    this.circulatingSupply = const Value.absent(),
    this.priceChange24h = const Value.absent(),
    this.totalSupply = const Value.absent(),
    this.maxSupply = const Value.absent(),
    this.priceChangePercentage24h = const Value.absent(),
    this.image = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CoinsEntityCompanion.insert({
    required String id,
    required String symbol,
    required String name,
    required double currentPrice,
    required double marketCap,
    required int marketCapRank,
    required double totalVolume,
    required double fullyDilutedValuation,
    required double circulatingSupply,
    required double priceChange24h,
    required double totalSupply,
    required double maxSupply,
    required double priceChangePercentage24h,
    required String image,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       symbol = Value(symbol),
       name = Value(name),
       currentPrice = Value(currentPrice),
       marketCap = Value(marketCap),
       marketCapRank = Value(marketCapRank),
       totalVolume = Value(totalVolume),
       fullyDilutedValuation = Value(fullyDilutedValuation),
       circulatingSupply = Value(circulatingSupply),
       priceChange24h = Value(priceChange24h),
       totalSupply = Value(totalSupply),
       maxSupply = Value(maxSupply),
       priceChangePercentage24h = Value(priceChangePercentage24h),
       image = Value(image);
  static Insertable<CoinsEntityData> custom({
    Expression<String>? id,
    Expression<String>? symbol,
    Expression<String>? name,
    Expression<double>? currentPrice,
    Expression<double>? marketCap,
    Expression<int>? marketCapRank,
    Expression<double>? totalVolume,
    Expression<double>? fullyDilutedValuation,
    Expression<double>? circulatingSupply,
    Expression<double>? priceChange24h,
    Expression<double>? totalSupply,
    Expression<double>? maxSupply,
    Expression<double>? priceChangePercentage24h,
    Expression<String>? image,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (symbol != null) 'symbol': symbol,
      if (name != null) 'name': name,
      if (currentPrice != null) 'current_price': currentPrice,
      if (marketCap != null) 'market_cap': marketCap,
      if (marketCapRank != null) 'market_cap_rank': marketCapRank,
      if (totalVolume != null) 'total_volume': totalVolume,
      if (fullyDilutedValuation != null)
        'fully_diluted_valuation': fullyDilutedValuation,
      if (circulatingSupply != null) 'circulating_supply': circulatingSupply,
      if (priceChange24h != null) 'price_change_24h': priceChange24h,
      if (totalSupply != null) 'total_supply': totalSupply,
      if (maxSupply != null) 'max_supply': maxSupply,
      if (priceChangePercentage24h != null)
        'price_change_percentage_24h': priceChangePercentage24h,
      if (image != null) 'image_url': image,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CoinsEntityCompanion copyWith({
    Value<String>? id,
    Value<String>? symbol,
    Value<String>? name,
    Value<double>? currentPrice,
    Value<double>? marketCap,
    Value<int>? marketCapRank,
    Value<double>? totalVolume,
    Value<double>? fullyDilutedValuation,
    Value<double>? circulatingSupply,
    Value<double>? priceChange24h,
    Value<double>? totalSupply,
    Value<double>? maxSupply,
    Value<double>? priceChangePercentage24h,
    Value<String>? image,
    Value<int>? rowid,
  }) {
    return CoinsEntityCompanion(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      currentPrice: currentPrice ?? this.currentPrice,
      marketCap: marketCap ?? this.marketCap,
      marketCapRank: marketCapRank ?? this.marketCapRank,
      totalVolume: totalVolume ?? this.totalVolume,
      fullyDilutedValuation:
          fullyDilutedValuation ?? this.fullyDilutedValuation,
      circulatingSupply: circulatingSupply ?? this.circulatingSupply,
      priceChange24h: priceChange24h ?? this.priceChange24h,
      totalSupply: totalSupply ?? this.totalSupply,
      maxSupply: maxSupply ?? this.maxSupply,
      priceChangePercentage24h:
          priceChangePercentage24h ?? this.priceChangePercentage24h,
      image: image ?? this.image,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (currentPrice.present) {
      map['current_price'] = Variable<double>(currentPrice.value);
    }
    if (marketCap.present) {
      map['market_cap'] = Variable<double>(marketCap.value);
    }
    if (marketCapRank.present) {
      map['market_cap_rank'] = Variable<int>(marketCapRank.value);
    }
    if (totalVolume.present) {
      map['total_volume'] = Variable<double>(totalVolume.value);
    }
    if (fullyDilutedValuation.present) {
      map['fully_diluted_valuation'] = Variable<double>(
        fullyDilutedValuation.value,
      );
    }
    if (circulatingSupply.present) {
      map['circulating_supply'] = Variable<double>(circulatingSupply.value);
    }
    if (priceChange24h.present) {
      map['price_change_24h'] = Variable<double>(priceChange24h.value);
    }
    if (totalSupply.present) {
      map['total_supply'] = Variable<double>(totalSupply.value);
    }
    if (maxSupply.present) {
      map['max_supply'] = Variable<double>(maxSupply.value);
    }
    if (priceChangePercentage24h.present) {
      map['price_change_percentage_24h'] = Variable<double>(
        priceChangePercentage24h.value,
      );
    }
    if (image.present) {
      map['image_url'] = Variable<String>(image.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoinsEntityCompanion(')
          ..write('id: $id, ')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('currentPrice: $currentPrice, ')
          ..write('marketCap: $marketCap, ')
          ..write('marketCapRank: $marketCapRank, ')
          ..write('totalVolume: $totalVolume, ')
          ..write('fullyDilutedValuation: $fullyDilutedValuation, ')
          ..write('circulatingSupply: $circulatingSupply, ')
          ..write('priceChange24h: $priceChange24h, ')
          ..write('totalSupply: $totalSupply, ')
          ..write('maxSupply: $maxSupply, ')
          ..write('priceChangePercentage24h: $priceChangePercentage24h, ')
          ..write('image: $image, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CoinsEntityTable coinsEntity = $CoinsEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [coinsEntity];
}

typedef $$CoinsEntityTableCreateCompanionBuilder =
    CoinsEntityCompanion Function({
      required String id,
      required String symbol,
      required String name,
      required double currentPrice,
      required double marketCap,
      required int marketCapRank,
      required double totalVolume,
      required double fullyDilutedValuation,
      required double circulatingSupply,
      required double priceChange24h,
      required double totalSupply,
      required double maxSupply,
      required double priceChangePercentage24h,
      required String image,
      Value<int> rowid,
    });
typedef $$CoinsEntityTableUpdateCompanionBuilder =
    CoinsEntityCompanion Function({
      Value<String> id,
      Value<String> symbol,
      Value<String> name,
      Value<double> currentPrice,
      Value<double> marketCap,
      Value<int> marketCapRank,
      Value<double> totalVolume,
      Value<double> fullyDilutedValuation,
      Value<double> circulatingSupply,
      Value<double> priceChange24h,
      Value<double> totalSupply,
      Value<double> maxSupply,
      Value<double> priceChangePercentage24h,
      Value<String> image,
      Value<int> rowid,
    });

class $$CoinsEntityTableFilterComposer
    extends Composer<_$AppDatabase, $CoinsEntityTable> {
  $$CoinsEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentPrice => $composableBuilder(
    column: $table.currentPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get marketCap => $composableBuilder(
    column: $table.marketCap,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get marketCapRank => $composableBuilder(
    column: $table.marketCapRank,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fullyDilutedValuation => $composableBuilder(
    column: $table.fullyDilutedValuation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get circulatingSupply => $composableBuilder(
    column: $table.circulatingSupply,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceChange24h => $composableBuilder(
    column: $table.priceChange24h,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalSupply => $composableBuilder(
    column: $table.totalSupply,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get maxSupply => $composableBuilder(
    column: $table.maxSupply,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get priceChangePercentage24h => $composableBuilder(
    column: $table.priceChangePercentage24h,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CoinsEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $CoinsEntityTable> {
  $$CoinsEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get symbol => $composableBuilder(
    column: $table.symbol,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentPrice => $composableBuilder(
    column: $table.currentPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get marketCap => $composableBuilder(
    column: $table.marketCap,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get marketCapRank => $composableBuilder(
    column: $table.marketCapRank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fullyDilutedValuation => $composableBuilder(
    column: $table.fullyDilutedValuation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get circulatingSupply => $composableBuilder(
    column: $table.circulatingSupply,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceChange24h => $composableBuilder(
    column: $table.priceChange24h,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalSupply => $composableBuilder(
    column: $table.totalSupply,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get maxSupply => $composableBuilder(
    column: $table.maxSupply,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get priceChangePercentage24h => $composableBuilder(
    column: $table.priceChangePercentage24h,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CoinsEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $CoinsEntityTable> {
  $$CoinsEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get symbol =>
      $composableBuilder(column: $table.symbol, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get currentPrice => $composableBuilder(
    column: $table.currentPrice,
    builder: (column) => column,
  );

  GeneratedColumn<double> get marketCap =>
      $composableBuilder(column: $table.marketCap, builder: (column) => column);

  GeneratedColumn<int> get marketCapRank => $composableBuilder(
    column: $table.marketCapRank,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalVolume => $composableBuilder(
    column: $table.totalVolume,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fullyDilutedValuation => $composableBuilder(
    column: $table.fullyDilutedValuation,
    builder: (column) => column,
  );

  GeneratedColumn<double> get circulatingSupply => $composableBuilder(
    column: $table.circulatingSupply,
    builder: (column) => column,
  );

  GeneratedColumn<double> get priceChange24h => $composableBuilder(
    column: $table.priceChange24h,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalSupply => $composableBuilder(
    column: $table.totalSupply,
    builder: (column) => column,
  );

  GeneratedColumn<double> get maxSupply =>
      $composableBuilder(column: $table.maxSupply, builder: (column) => column);

  GeneratedColumn<double> get priceChangePercentage24h => $composableBuilder(
    column: $table.priceChangePercentage24h,
    builder: (column) => column,
  );

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);
}

class $$CoinsEntityTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CoinsEntityTable,
          CoinsEntityData,
          $$CoinsEntityTableFilterComposer,
          $$CoinsEntityTableOrderingComposer,
          $$CoinsEntityTableAnnotationComposer,
          $$CoinsEntityTableCreateCompanionBuilder,
          $$CoinsEntityTableUpdateCompanionBuilder,
          (
            CoinsEntityData,
            BaseReferences<_$AppDatabase, $CoinsEntityTable, CoinsEntityData>,
          ),
          CoinsEntityData,
          PrefetchHooks Function()
        > {
  $$CoinsEntityTableTableManager(_$AppDatabase db, $CoinsEntityTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoinsEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoinsEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CoinsEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> symbol = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> currentPrice = const Value.absent(),
                Value<double> marketCap = const Value.absent(),
                Value<int> marketCapRank = const Value.absent(),
                Value<double> totalVolume = const Value.absent(),
                Value<double> fullyDilutedValuation = const Value.absent(),
                Value<double> circulatingSupply = const Value.absent(),
                Value<double> priceChange24h = const Value.absent(),
                Value<double> totalSupply = const Value.absent(),
                Value<double> maxSupply = const Value.absent(),
                Value<double> priceChangePercentage24h = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CoinsEntityCompanion(
                id: id,
                symbol: symbol,
                name: name,
                currentPrice: currentPrice,
                marketCap: marketCap,
                marketCapRank: marketCapRank,
                totalVolume: totalVolume,
                fullyDilutedValuation: fullyDilutedValuation,
                circulatingSupply: circulatingSupply,
                priceChange24h: priceChange24h,
                totalSupply: totalSupply,
                maxSupply: maxSupply,
                priceChangePercentage24h: priceChangePercentage24h,
                image: image,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String symbol,
                required String name,
                required double currentPrice,
                required double marketCap,
                required int marketCapRank,
                required double totalVolume,
                required double fullyDilutedValuation,
                required double circulatingSupply,
                required double priceChange24h,
                required double totalSupply,
                required double maxSupply,
                required double priceChangePercentage24h,
                required String image,
                Value<int> rowid = const Value.absent(),
              }) => CoinsEntityCompanion.insert(
                id: id,
                symbol: symbol,
                name: name,
                currentPrice: currentPrice,
                marketCap: marketCap,
                marketCapRank: marketCapRank,
                totalVolume: totalVolume,
                fullyDilutedValuation: fullyDilutedValuation,
                circulatingSupply: circulatingSupply,
                priceChange24h: priceChange24h,
                totalSupply: totalSupply,
                maxSupply: maxSupply,
                priceChangePercentage24h: priceChangePercentage24h,
                image: image,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CoinsEntityTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CoinsEntityTable,
      CoinsEntityData,
      $$CoinsEntityTableFilterComposer,
      $$CoinsEntityTableOrderingComposer,
      $$CoinsEntityTableAnnotationComposer,
      $$CoinsEntityTableCreateCompanionBuilder,
      $$CoinsEntityTableUpdateCompanionBuilder,
      (
        CoinsEntityData,
        BaseReferences<_$AppDatabase, $CoinsEntityTable, CoinsEntityData>,
      ),
      CoinsEntityData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CoinsEntityTableTableManager get coinsEntity =>
      $$CoinsEntityTableTableManager(_db, _db.coinsEntity);
}
