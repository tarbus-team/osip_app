// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gtfs_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorGtfsDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$GtfsDatabaseBuilder databaseBuilder(String name) =>
      _$GtfsDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$GtfsDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$GtfsDatabaseBuilder(null);
}

class _$GtfsDatabaseBuilder {
  _$GtfsDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$GtfsDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$GtfsDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<GtfsDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$GtfsDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$GtfsDatabase extends GtfsDatabase {
  _$GtfsDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AgencyRepository? _agencyRepositoryInstance;

  AttributionsRepository? _attributionsRepositoryInstance;

  CalendarDatesRepository? _calendarDatesRepositoryInstance;

  CalendarRepository? _calendarRepositoryInstance;

  FareAttributesRepository? _fareAttributesRepositoryInstance;

  FareRulesRepository? _fareRulesRepositoryInstance;

  FeedInfoRepository? _feedInfoRepositoryInstance;

  FrequenciesRepository? _frequenciesRepositoryInstance;

  LevelsRepository? _levelsRepositoryInstance;

  PathwaysRepository? _pathwaysRepositoryInstance;

  RoutesRepository? _routesRepositoryInstance;

  ShapesRepository? _shapesRepositoryInstance;

  StopTimesRepository? _stopTimesRepositoryInstance;

  StopsRepository? _stopsRepositoryInstance;

  TransfersRepository? _transfersRepositoryInstance;

  TripsRepository? _tripsRepositoryInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `agency` (`agency_id` TEXT, `agency_name` TEXT NOT NULL, `agency_url` TEXT NOT NULL, `agency_timezone` TEXT NOT NULL, `agency_lang` TEXT, `agency_phone` TEXT, `agency_fare_url` TEXT, `agency_email` TEXT, PRIMARY KEY (`agency_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `attributions` (`attribution_id` TEXT NOT NULL, `agency_id` TEXT, `route_id` TEXT, `trip_id` TEXT, `organization_name` TEXT NOT NULL, `is_producer` INTEGER, `is_operator` INTEGER, `is_authority` INTEGER, `attribution_url` TEXT, `attribution_email` TEXT, `attribution_phone` TEXT, FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`attribution_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `calendar_dates` (`service_id` TEXT NOT NULL, `date` TEXT NOT NULL, `exception_type` INTEGER, PRIMARY KEY (`service_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `calendar` (`service_id` TEXT NOT NULL, `monday` INTEGER NOT NULL, `tuesday` INTEGER NOT NULL, `wednesday` INTEGER NOT NULL, `thursday` INTEGER NOT NULL, `friday` INTEGER NOT NULL, `saturday` INTEGER NOT NULL, `sunday` INTEGER NOT NULL, `start_date` TEXT NOT NULL, `end_date` TEXT NOT NULL, PRIMARY KEY (`service_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `fare_attributes` (`fare_id` TEXT NOT NULL, `price` REAL NOT NULL, `currency_type` TEXT NOT NULL, `payment_method` INTEGER NOT NULL, `transfers` INTEGER NOT NULL, `agency_id` TEXT, `transfer_duration` INTEGER, FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`fare_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `fare_rules` (`id` TEXT NOT NULL, `fare_id` TEXT NOT NULL, `route_id` TEXT, `origin_id` TEXT, `destination_id` TEXT, `contains_id` TEXT, FOREIGN KEY (`fare_id`) REFERENCES `fare_attributes` (`fare_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`origin_id`) REFERENCES `stops` (`zone_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`destination_id`) REFERENCES `stops` (`zone_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`contains_id`) REFERENCES `stops` (`zone_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `feed_info` (`id` TEXT, `feed_publisher_name` TEXT NOT NULL, `feed_publisher_url` TEXT NOT NULL, `feed_lang` TEXT NOT NULL, `default_lang` TEXT, `feed_start_date` TEXT, `feed_end_date` TEXT, `feed_version` TEXT, `feed_contact_email` TEXT, `feed_contact_url` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `frequencies` (`trip_id` TEXT NOT NULL, `start_time` TEXT NOT NULL, `end_time` TEXT NOT NULL, `headway_secs` INTEGER NOT NULL, `exact_times` INTEGER, FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`trip_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `levels` (`level_id` TEXT NOT NULL, `level_index` REAL NOT NULL, `level_name` TEXT, PRIMARY KEY (`level_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `pathways` (`pathway_id` TEXT NOT NULL, `from_stop_id` TEXT NOT NULL, `to_stop_id` TEXT NOT NULL, `pathway_mode` INTEGER NOT NULL, `is_bidirectional` INTEGER NOT NULL, `length` REAL, `traversal_time` INTEGER, `stair_count` INTEGER, `max_slope` REAL, `min_width` REAL, `signposted_as` TEXT, `reversed_signposted_as` TEXT, FOREIGN KEY (`from_stop_id`) REFERENCES `stops` (`stop_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`to_stop_id`) REFERENCES `stops` (`stop_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`pathway_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `routes` (`route_id` TEXT NOT NULL, `agency_id` TEXT, `route_short_name` TEXT, `route_long_name` TEXT, `route_desc` TEXT, `route_type` INTEGER NOT NULL, `route_url` TEXT, `route_color` TEXT, `route_text_color` TEXT, `route_sort_order` INTEGER, `continuous_pickup` INTEGER, `continuous_drop_off` INTEGER, FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`route_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `shapes` (`shape_id` TEXT NOT NULL, `shape_pt_lat` REAL NOT NULL, `shape_pt_lon` REAL NOT NULL, `shape_pt_sequence` INTEGER NOT NULL, `shape_dist_traveled` REAL, PRIMARY KEY (`shape_id`, `shape_pt_sequence`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `stops` (`stop_id` TEXT NOT NULL, `stop_code` TEXT, `stop_name` TEXT NOT NULL, `stop_desc` TEXT, `stop_lat` REAL NOT NULL, `stop_lon` REAL NOT NULL, `zone_id` TEXT, `stop_url` TEXT, `location_type` INTEGER, `parent_station` TEXT, `stop_timezone` TEXT, `wheelchair_boarding` INTEGER, `level_id` TEXT, `platform_code` TEXT, FOREIGN KEY (`parent_station`) REFERENCES `stops` (`stop_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`stop_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `stop_times` (`id` TEXT NOT NULL, `trip_id` TEXT NOT NULL, `arrival_time` TEXT NOT NULL, `departure_time` TEXT NOT NULL, `stop_id` TEXT NOT NULL, `stop_sequence` INTEGER NOT NULL, `stop_headsign` TEXT, `pickup_type` INTEGER, `drop_off_type` INTEGER, `continuous_pickup` INTEGER, `continuous_drop_off` INTEGER, `shape_dist_traveled` REAL, `timepoint` INTEGER, FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`stop_id`) REFERENCES `stops` (`stop_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `transfers` (`id` TEXT NOT NULL, `from_stop_id` TEXT NOT NULL, `to_stop_id` TEXT NOT NULL, `transfer_type` INTEGER NOT NULL, `min_transfer_time` INTEGER, FOREIGN KEY (`from_stop_id`) REFERENCES `stops` (`stop_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`to_stop_id`) REFERENCES `stops` (`stop_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `trip` (`trip_id` TEXT NOT NULL, `route_id` TEXT NOT NULL, `service_id` TEXT NOT NULL, `trip_headsign` TEXT, `trip_short_name` TEXT, `direction_id` INTEGER, `block_id` TEXT, `shape_id` TEXT, `wheelchair_accessible` INTEGER, `bikes_allowed` INTEGER, FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`trip_id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AgencyRepository get agencyRepository {
    return _agencyRepositoryInstance ??=
        _$AgencyRepository(database, changeListener);
  }

  @override
  AttributionsRepository get attributionsRepository {
    return _attributionsRepositoryInstance ??=
        _$AttributionsRepository(database, changeListener);
  }

  @override
  CalendarDatesRepository get calendarDatesRepository {
    return _calendarDatesRepositoryInstance ??=
        _$CalendarDatesRepository(database, changeListener);
  }

  @override
  CalendarRepository get calendarRepository {
    return _calendarRepositoryInstance ??=
        _$CalendarRepository(database, changeListener);
  }

  @override
  FareAttributesRepository get fareAttributesRepository {
    return _fareAttributesRepositoryInstance ??=
        _$FareAttributesRepository(database, changeListener);
  }

  @override
  FareRulesRepository get fareRulesRepository {
    return _fareRulesRepositoryInstance ??=
        _$FareRulesRepository(database, changeListener);
  }

  @override
  FeedInfoRepository get feedInfoRepository {
    return _feedInfoRepositoryInstance ??=
        _$FeedInfoRepository(database, changeListener);
  }

  @override
  FrequenciesRepository get frequenciesRepository {
    return _frequenciesRepositoryInstance ??=
        _$FrequenciesRepository(database, changeListener);
  }

  @override
  LevelsRepository get levelsRepository {
    return _levelsRepositoryInstance ??=
        _$LevelsRepository(database, changeListener);
  }

  @override
  PathwaysRepository get pathwaysRepository {
    return _pathwaysRepositoryInstance ??=
        _$PathwaysRepository(database, changeListener);
  }

  @override
  RoutesRepository get routesRepository {
    return _routesRepositoryInstance ??=
        _$RoutesRepository(database, changeListener);
  }

  @override
  ShapesRepository get shapesRepository {
    return _shapesRepositoryInstance ??=
        _$ShapesRepository(database, changeListener);
  }

  @override
  StopTimesRepository get stopTimesRepository {
    return _stopTimesRepositoryInstance ??=
        _$StopTimesRepository(database, changeListener);
  }

  @override
  StopsRepository get stopsRepository {
    return _stopsRepositoryInstance ??=
        _$StopsRepository(database, changeListener);
  }

  @override
  TransfersRepository get transfersRepository {
    return _transfersRepositoryInstance ??=
        _$TransfersRepository(database, changeListener);
  }

  @override
  TripsRepository get tripsRepository {
    return _tripsRepositoryInstance ??=
        _$TripsRepository(database, changeListener);
  }
}

class _$AgencyRepository extends AgencyRepository {
  _$AgencyRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _agencyEntityInsertionAdapter = InsertionAdapter(
            database,
            'agency',
            (AgencyEntity item) => <String, Object?>{
                  'agency_id': _nullableIDConverter.encode(item.agencyId),
                  'agency_name': item.agencyName,
                  'agency_url': _urlConverter.encode(item.agencyUrl),
                  'agency_timezone':
                      _timezoneConverter.encode(item.agencyTimezone),
                  'agency_lang':
                      _nullableLanguageCodeConverter.encode(item.agencyLang),
                  'agency_phone':
                      _nullablePhoneNumberConverter.encode(item.agencyPhone),
                  'agency_fare_url':
                      _nullableUrlConverter.encode(item.agencyFareUrl),
                  'agency_email':
                      _nullableEmailConverter.encode(item.agencyEmail)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AgencyEntity> _agencyEntityInsertionAdapter;

  @override
  Future<List<AgencyEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM agency',
        mapper: (Map<String, Object?> row) => AgencyEntity(
            _nullableIDConverter.decode(row['agency_id'] as String?),
            row['agency_name'] as String,
            _urlConverter.decode(row['agency_url'] as String),
            _timezoneConverter.decode(row['agency_timezone'] as String),
            _nullableLanguageCodeConverter
                .decode(row['agency_lang'] as String?),
            _nullablePhoneNumberConverter
                .decode(row['agency_phone'] as String?),
            _nullableUrlConverter.decode(row['agency_fare_url'] as String?),
            _nullableEmailConverter.decode(row['agency_email'] as String?)));
  }

  @override
  Future<List<int>> insertAll(List<AgencyEntity> agencyEntityList) {
    return _agencyEntityInsertionAdapter.insertListAndReturnIds(
        agencyEntityList, OnConflictStrategy.abort);
  }
}

class _$AttributionsRepository extends AttributionsRepository {
  _$AttributionsRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _attributionEntityInsertionAdapter = InsertionAdapter(
            database,
            'attributions',
            (AttributionEntity item) => <String, Object?>{
                  'attribution_id': _iDConverter.encode(item.attributionId),
                  'agency_id': _nullableIDConverter.encode(item.agencyId),
                  'route_id': _nullableIDConverter.encode(item.routeId),
                  'trip_id': _nullableIDConverter.encode(item.tripId),
                  'organization_name': item.organizationName,
                  'is_producer': item.isProducer == null
                      ? null
                      : (item.isProducer! ? 1 : 0),
                  'is_operator': item.isOperator == null
                      ? null
                      : (item.isOperator! ? 1 : 0),
                  'is_authority': item.isAuthority == null
                      ? null
                      : (item.isAuthority! ? 1 : 0),
                  'attribution_url':
                      _nullableUrlConverter.encode(item.attributionUrl),
                  'attribution_email':
                      _nullableEmailConverter.encode(item.attributionEmail),
                  'attribution_phone': _nullablePhoneNumberConverter
                      .encode(item.attributionPhone)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AttributionEntity> _attributionEntityInsertionAdapter;

  @override
  Future<List<AttributionEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM attributions',
        mapper: (Map<String, Object?> row) => AttributionEntity(
            _iDConverter.decode(row['attribution_id'] as String),
            _nullableIDConverter.decode(row['agency_id'] as String?),
            _nullableIDConverter.decode(row['route_id'] as String?),
            _nullableIDConverter.decode(row['trip_id'] as String?),
            row['organization_name'] as String,
            row['is_producer'] == null
                ? null
                : (row['is_producer'] as int) != 0,
            row['is_operator'] == null
                ? null
                : (row['is_operator'] as int) != 0,
            row['is_authority'] == null
                ? null
                : (row['is_authority'] as int) != 0,
            _nullableUrlConverter.decode(row['attribution_url'] as String?),
            _nullableEmailConverter.decode(row['attribution_email'] as String?),
            _nullablePhoneNumberConverter
                .decode(row['attribution_phone'] as String?)));
  }

  @override
  Future<List<int>> insertAll(List<AttributionEntity> attributionEntityList) {
    return _attributionEntityInsertionAdapter.insertListAndReturnIds(
        attributionEntityList, OnConflictStrategy.abort);
  }
}

class _$CalendarDatesRepository extends CalendarDatesRepository {
  _$CalendarDatesRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _calendarDateEntityInsertionAdapter = InsertionAdapter(
            database,
            'calendar_dates',
            (CalendarDateEntity item) => <String, Object?>{
                  'service_id': _iDConverter.encode(item.serviceId),
                  'date': _dateConverter.encode(item.date),
                  'exception_type': item.exceptionType?.index
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CalendarDateEntity>
      _calendarDateEntityInsertionAdapter;

  @override
  Future<List<CalendarDateEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM calendar_dates',
        mapper: (Map<String, Object?> row) => CalendarDateEntity(
            _iDConverter.decode(row['service_id'] as String),
            _dateConverter.decode(row['date'] as String),
            row['exception_type'] == null
                ? null
                : ServiceExceptionType.values[row['exception_type'] as int]));
  }

  @override
  Future<List<int>> insertAll(List<CalendarDateEntity> calendarDates) {
    return _calendarDateEntityInsertionAdapter.insertListAndReturnIds(
        calendarDates, OnConflictStrategy.abort);
  }
}

class _$CalendarRepository extends CalendarRepository {
  _$CalendarRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _calendarEntityInsertionAdapter = InsertionAdapter(
            database,
            'calendar',
            (CalendarEntity item) => <String, Object?>{
                  'service_id': _iDConverter.encode(item.serviceId),
                  'monday': item.monday.index,
                  'tuesday': item.tuesday.index,
                  'wednesday': item.wednesday.index,
                  'thursday': item.thursday.index,
                  'friday': item.friday.index,
                  'saturday': item.saturday.index,
                  'sunday': item.sunday.index,
                  'start_date': _dateConverter.encode(item.startDate),
                  'end_date': _dateConverter.encode(item.endDate)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CalendarEntity> _calendarEntityInsertionAdapter;

  @override
  Future<List<CalendarEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM calendar',
        mapper: (Map<String, Object?> row) => CalendarEntity(
            _iDConverter.decode(row['service_id'] as String),
            ServiceAvailability.values[row['monday'] as int],
            ServiceAvailability.values[row['tuesday'] as int],
            ServiceAvailability.values[row['wednesday'] as int],
            ServiceAvailability.values[row['thursday'] as int],
            ServiceAvailability.values[row['friday'] as int],
            ServiceAvailability.values[row['saturday'] as int],
            ServiceAvailability.values[row['sunday'] as int],
            _dateConverter.decode(row['start_date'] as String),
            _dateConverter.decode(row['end_date'] as String)));
  }

  @override
  Future<List<int>> insertAll(List<CalendarEntity> calendars) {
    return _calendarEntityInsertionAdapter.insertListAndReturnIds(
        calendars, OnConflictStrategy.abort);
  }
}

class _$FareAttributesRepository extends FareAttributesRepository {
  _$FareAttributesRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _fareAttributeEntityInsertionAdapter = InsertionAdapter(
            database,
            'fare_attributes',
            (FareAttributeEntity item) => <String, Object?>{
                  'fare_id': _iDConverter.encode(item.fareId),
                  'price': item.price,
                  'currency_type':
                      _currencyCodeConverter.encode(item.currencyType),
                  'payment_method': item.paymentMethod.index,
                  'transfers': item.transfers.index,
                  'agency_id': _nullableIDConverter.encode(item.agencyId),
                  'transfer_duration': item.transferDuration
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FareAttributeEntity>
      _fareAttributeEntityInsertionAdapter;

  @override
  Future<List<FareAttributeEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM fare_attributes',
        mapper: (Map<String, Object?> row) => FareAttributeEntity(
            _iDConverter.decode(row['fare_id'] as String),
            row['price'] as double,
            _currencyCodeConverter.decode(row['currency_type'] as String),
            PaymentMethod.values[row['payment_method'] as int],
            Transfers.values[row['transfers'] as int],
            _nullableIDConverter.decode(row['agency_id'] as String?),
            row['transfer_duration'] as int?));
  }

  @override
  Future<List<int>> insertAll(List<FareAttributeEntity> fareAttributes) {
    return _fareAttributeEntityInsertionAdapter.insertListAndReturnIds(
        fareAttributes, OnConflictStrategy.abort);
  }
}

class _$FareRulesRepository extends FareRulesRepository {
  _$FareRulesRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _fareRuleEntityInsertionAdapter = InsertionAdapter(
            database,
            'fare_rules',
            (FareRuleEntity item) => <String, Object?>{
                  'id': item.id,
                  'fare_id': _iDConverter.encode(item.fareId),
                  'route_id': _nullableIDConverter.encode(item.routeId),
                  'origin_id': _nullableIDConverter.encode(item.originId),
                  'destination_id':
                      _nullableIDConverter.encode(item.destinationId),
                  'contains_id': _nullableIDConverter.encode(item.containsId)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FareRuleEntity> _fareRuleEntityInsertionAdapter;

  @override
  Future<List<FareRuleEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM fare_rules',
        mapper: (Map<String, Object?> row) => FareRuleEntity(
            row['id'] as String,
            _iDConverter.decode(row['fare_id'] as String),
            _nullableIDConverter.decode(row['route_id'] as String?),
            _nullableIDConverter.decode(row['origin_id'] as String?),
            _nullableIDConverter.decode(row['destination_id'] as String?),
            _nullableIDConverter.decode(row['contains_id'] as String?)));
  }

  @override
  Future<List<int>> insertAll(List<FareRuleEntity> fareRules) {
    return _fareRuleEntityInsertionAdapter.insertListAndReturnIds(
        fareRules, OnConflictStrategy.abort);
  }
}

class _$FeedInfoRepository extends FeedInfoRepository {
  _$FeedInfoRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _feedInfoEntityInsertionAdapter = InsertionAdapter(
            database,
            'feed_info',
            (FeedInfoEntity item) => <String, Object?>{
                  'id': item.id,
                  'feed_publisher_name': item.feedPublisherName,
                  'feed_publisher_url':
                      _urlConverter.encode(item.feedPublisherUrl),
                  'feed_lang': _languageCodeConverter.encode(item.feedLang),
                  'default_lang':
                      _nullableLanguageCodeConverter.encode(item.defaultLang),
                  'feed_start_date':
                      _nullableDateConverter.encode(item.feedStartDate),
                  'feed_end_date':
                      _nullableDateConverter.encode(item.feedEndDate),
                  'feed_version': item.feedVersion,
                  'feed_contact_email':
                      _nullableEmailConverter.encode(item.feedContactEmail),
                  'feed_contact_url':
                      _nullableUrlConverter.encode(item.feedContactUrl)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FeedInfoEntity> _feedInfoEntityInsertionAdapter;

  @override
  Future<List<FeedInfoEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM feed_info',
        mapper: (Map<String, Object?> row) => FeedInfoEntity(
            row['id'] as String?,
            row['feed_publisher_name'] as String,
            _urlConverter.decode(row['feed_publisher_url'] as String),
            _languageCodeConverter.decode(row['feed_lang'] as String),
            _nullableLanguageCodeConverter
                .decode(row['default_lang'] as String?),
            _nullableDateConverter.decode(row['feed_start_date'] as String?),
            _nullableDateConverter.decode(row['feed_end_date'] as String?),
            row['feed_version'] as String?,
            _nullableEmailConverter
                .decode(row['feed_contact_email'] as String?),
            _nullableUrlConverter.decode(row['feed_contact_url'] as String?)));
  }

  @override
  Future<List<int>> insertAll(List<FeedInfoEntity> feedInfos) {
    return _feedInfoEntityInsertionAdapter.insertListAndReturnIds(
        feedInfos, OnConflictStrategy.abort);
  }
}

class _$FrequenciesRepository extends FrequenciesRepository {
  _$FrequenciesRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _frequencyEntityInsertionAdapter = InsertionAdapter(
            database,
            'frequencies',
            (FrequencyEntity item) => <String, Object?>{
                  'trip_id': _iDConverter.encode(item.tripId),
                  'start_time': _timeConverter.encode(item.startTime),
                  'end_time': _timeConverter.encode(item.endTime),
                  'headway_secs': item.headwaySecs,
                  'exact_times': item.exactTimes?.index
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FrequencyEntity> _frequencyEntityInsertionAdapter;

  @override
  Future<List<FrequencyEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM frequencies',
        mapper: (Map<String, Object?> row) => FrequencyEntity(
            _iDConverter.decode(row['trip_id'] as String),
            _timeConverter.decode(row['start_time'] as String),
            _timeConverter.decode(row['end_time'] as String),
            row['headway_secs'] as int,
            row['exact_times'] == null
                ? null
                : ExactTimes.values[row['exact_times'] as int]));
  }

  @override
  Future<List<int>> insertAll(List<FrequencyEntity> frequencies) {
    return _frequencyEntityInsertionAdapter.insertListAndReturnIds(
        frequencies, OnConflictStrategy.abort);
  }
}

class _$LevelsRepository extends LevelsRepository {
  _$LevelsRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _levelEntityInsertionAdapter = InsertionAdapter(
            database,
            'levels',
            (LevelEntity item) => <String, Object?>{
                  'level_id': _iDConverter.encode(item.levelId),
                  'level_index': item.levelIndex,
                  'level_name': item.levelName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LevelEntity> _levelEntityInsertionAdapter;

  @override
  Future<List<LevelEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM levels',
        mapper: (Map<String, Object?> row) => LevelEntity(
            _iDConverter.decode(row['level_id'] as String),
            row['level_index'] as double,
            row['level_name'] as String?));
  }

  @override
  Future<List<int>> insertAll(List<LevelEntity> levels) {
    return _levelEntityInsertionAdapter.insertListAndReturnIds(
        levels, OnConflictStrategy.abort);
  }
}

class _$PathwaysRepository extends PathwaysRepository {
  _$PathwaysRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _pathwayEntityInsertionAdapter = InsertionAdapter(
            database,
            'pathways',
            (PathwayEntity item) => <String, Object?>{
                  'pathway_id': _iDConverter.encode(item.pathwayId),
                  'from_stop_id': _iDConverter.encode(item.fromStopId),
                  'to_stop_id': _iDConverter.encode(item.toStopId),
                  'pathway_mode': item.pathwayMode.index,
                  'is_bidirectional': item.isBidirectional ? 1 : 0,
                  'length': item.length,
                  'traversal_time': item.traversalTime,
                  'stair_count': item.stairCount,
                  'max_slope': item.maxSlope,
                  'min_width': item.minWidth,
                  'signposted_as': item.signpostedAs,
                  'reversed_signposted_as': item.reversedSignpostedAs
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PathwayEntity> _pathwayEntityInsertionAdapter;

  @override
  Future<List<PathwayEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM pathways',
        mapper: (Map<String, Object?> row) => PathwayEntity(
            _iDConverter.decode(row['pathway_id'] as String),
            _iDConverter.decode(row['from_stop_id'] as String),
            _iDConverter.decode(row['to_stop_id'] as String),
            PathwayMode.values[row['pathway_mode'] as int],
            (row['is_bidirectional'] as int) != 0,
            row['length'] as double?,
            row['traversal_time'] as int?,
            row['stair_count'] as int?,
            row['max_slope'] as double?,
            row['min_width'] as double?,
            row['signposted_as'] as String?,
            row['reversed_signposted_as'] as String?));
  }

  @override
  Future<List<int>> insertAll(List<PathwayEntity> pathways) {
    return _pathwayEntityInsertionAdapter.insertListAndReturnIds(
        pathways, OnConflictStrategy.abort);
  }
}

class _$RoutesRepository extends RoutesRepository {
  _$RoutesRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _routeEntityInsertionAdapter = InsertionAdapter(
            database,
            'routes',
            (RouteEntity item) => <String, Object?>{
                  'route_id': _iDConverter.encode(item.routeId),
                  'agency_id': _nullableIDConverter.encode(item.agencyId),
                  'route_short_name': item.routeShortName,
                  'route_long_name': item.routeLongName,
                  'route_desc': item.routeDesc,
                  'route_type': item.routeType.index,
                  'route_url': _nullableUrlConverter.encode(item.routeUrl),
                  'route_color': item.routeColor,
                  'route_text_color': item.routeTextColor,
                  'route_sort_order': item.routeSortOrder,
                  'continuous_pickup': item.continuousPickup?.index,
                  'continuous_drop_off': item.continuousDropOff?.index
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RouteEntity> _routeEntityInsertionAdapter;

  @override
  Future<List<RouteEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM routes',
        mapper: (Map<String, Object?> row) => RouteEntity(
            _iDConverter.decode(row['route_id'] as String),
            _nullableIDConverter.decode(row['agency_id'] as String?),
            row['route_short_name'] as String?,
            row['route_long_name'] as String?,
            row['route_desc'] as String?,
            RouteType.values[row['route_type'] as int],
            _nullableUrlConverter.decode(row['route_url'] as String?),
            row['route_color'] as String?,
            row['route_text_color'] as String?,
            row['route_sort_order'] as int?,
            row['continuous_pickup'] == null
                ? null
                : ContinuousPickup.values[row['continuous_pickup'] as int],
            row['continuous_drop_off'] == null
                ? null
                : ContinuousDropOff.values[row['continuous_drop_off'] as int]));
  }

  @override
  Future<List<int>> insertAll(List<RouteEntity> routes) {
    return _routeEntityInsertionAdapter.insertListAndReturnIds(
        routes, OnConflictStrategy.abort);
  }
}

class _$ShapesRepository extends ShapesRepository {
  _$ShapesRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _shapeEntityInsertionAdapter = InsertionAdapter(
            database,
            'shapes',
            (ShapeEntity item) => <String, Object?>{
                  'shape_id': _iDConverter.encode(item.shapeId),
                  'shape_pt_lat': item.shapePtLat,
                  'shape_pt_lon': item.shapePtLon,
                  'shape_pt_sequence': item.shapePtSequence,
                  'shape_dist_traveled': item.shapeDistTraveled
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ShapeEntity> _shapeEntityInsertionAdapter;

  @override
  Future<List<ShapeEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM shapes',
        mapper: (Map<String, Object?> row) => ShapeEntity(
            _iDConverter.decode(row['shape_id'] as String),
            row['shape_pt_lat'] as double,
            row['shape_pt_lon'] as double,
            row['shape_pt_sequence'] as int,
            row['shape_dist_traveled'] as double?));
  }

  @override
  Future<List<int>> insertAll(List<ShapeEntity> shapes) {
    return _shapeEntityInsertionAdapter.insertListAndReturnIds(
        shapes, OnConflictStrategy.abort);
  }
}

class _$StopTimesRepository extends StopTimesRepository {
  _$StopTimesRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _stopTimeEntityInsertionAdapter = InsertionAdapter(
            database,
            'stop_times',
            (StopTimeEntity item) => <String, Object?>{
                  'id': item.id,
                  'trip_id': _iDConverter.encode(item.tripId),
                  'arrival_time': _timeConverter.encode(item.arrivalTime),
                  'departure_time': _timeConverter.encode(item.departureTime),
                  'stop_id': _iDConverter.encode(item.stopId),
                  'stop_sequence': item.stopSequence,
                  'stop_headsign': item.stopHeadsign,
                  'pickup_type': item.pickupType?.index,
                  'drop_off_type': item.dropOffType?.index,
                  'continuous_pickup': item.continuousPickup?.index,
                  'continuous_drop_off': item.continuousDropOff?.index,
                  'shape_dist_traveled': item.shapeDistTraveled,
                  'timepoint': item.timepoint?.index
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StopTimeEntity> _stopTimeEntityInsertionAdapter;

  @override
  Future<List<StopTimeEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM stop_times',
        mapper: (Map<String, Object?> row) => StopTimeEntity(
            row['id'] as String,
            _iDConverter.decode(row['trip_id'] as String),
            _timeConverter.decode(row['arrival_time'] as String),
            _timeConverter.decode(row['departure_time'] as String),
            _iDConverter.decode(row['stop_id'] as String),
            row['stop_sequence'] as int,
            row['stop_headsign'] as String?,
            row['pickup_type'] == null
                ? null
                : PickupType.values[row['pickup_type'] as int],
            row['drop_off_type'] == null
                ? null
                : DropOffType.values[row['drop_off_type'] as int],
            row['continuous_pickup'] == null
                ? null
                : ContinuousPickup.values[row['continuous_pickup'] as int],
            row['continuous_drop_off'] == null
                ? null
                : ContinuousDropOff.values[row['continuous_drop_off'] as int],
            row['shape_dist_traveled'] as double?,
            row['timepoint'] == null
                ? null
                : Timepoint.values[row['timepoint'] as int]));
  }

  @override
  Future<int?> findSize() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM stop_times',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<List<int>> insertAll(List<StopTimeEntity> stopTimes) {
    return _stopTimeEntityInsertionAdapter.insertListAndReturnIds(
        stopTimes, OnConflictStrategy.abort);
  }
}

class _$StopsRepository extends StopsRepository {
  _$StopsRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _stopEntityInsertionAdapter = InsertionAdapter(
            database,
            'stops',
            (StopEntity item) => <String, Object?>{
                  'stop_id': _iDConverter.encode(item.stopId),
                  'stop_code': item.stopCode,
                  'stop_name': item.stopName,
                  'stop_desc': item.stopDesc,
                  'stop_lat': item.stopLat,
                  'stop_lon': item.stopLon,
                  'zone_id': _nullableIDConverter.encode(item.zoneId),
                  'stop_url': _nullableUrlConverter.encode(item.stopUrl),
                  'location_type': item.locationType?.index,
                  'parent_station':
                      _nullableIDConverter.encode(item.parentStation),
                  'stop_timezone':
                      _nullableTimezoneConverter.encode(item.stopTimezone),
                  'wheelchair_boarding': item.wheelchairBoarding?.index,
                  'level_id': _nullableIDConverter.encode(item.levelId),
                  'platform_code': item.platformCode
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<StopEntity> _stopEntityInsertionAdapter;

  @override
  Future<List<StopEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM stops',
        mapper: (Map<String, Object?> row) => StopEntity(
            _iDConverter.decode(row['stop_id'] as String),
            row['stop_code'] as String?,
            row['stop_name'] as String,
            row['stop_desc'] as String?,
            row['stop_lat'] as double,
            row['stop_lon'] as double,
            _nullableIDConverter.decode(row['zone_id'] as String?),
            _nullableUrlConverter.decode(row['stop_url'] as String?),
            row['location_type'] == null
                ? null
                : LocationType.values[row['location_type'] as int],
            _nullableIDConverter.decode(row['parent_station'] as String?),
            _nullableTimezoneConverter.decode(row['stop_timezone'] as String?),
            row['wheelchair_boarding'] == null
                ? null
                : WheelchairBoarding.values[row['wheelchair_boarding'] as int],
            _nullableIDConverter.decode(row['level_id'] as String?),
            row['platform_code'] as String?));
  }

  @override
  Future<List<int>> insertAll(List<StopEntity> stops) {
    return _stopEntityInsertionAdapter.insertListAndReturnIds(
        stops, OnConflictStrategy.abort);
  }
}

class _$TransfersRepository extends TransfersRepository {
  _$TransfersRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _transferEntityInsertionAdapter = InsertionAdapter(
            database,
            'transfers',
            (TransferEntity item) => <String, Object?>{
                  'id': item.id,
                  'from_stop_id': _iDConverter.encode(item.fromStopId),
                  'to_stop_id': _iDConverter.encode(item.toStopId),
                  'transfer_type': item.transferType.index,
                  'min_transfer_time': item.minTransferTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TransferEntity> _transferEntityInsertionAdapter;

  @override
  Future<List<TransferEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM transfers',
        mapper: (Map<String, Object?> row) => TransferEntity(
            row['id'] as String,
            _iDConverter.decode(row['from_stop_id'] as String),
            _iDConverter.decode(row['to_stop_id'] as String),
            TransferType.values[row['transfer_type'] as int],
            row['min_transfer_time'] as int?));
  }

  @override
  Future<List<int>> insertAll(List<TransferEntity> transfers) {
    return _transferEntityInsertionAdapter.insertListAndReturnIds(
        transfers, OnConflictStrategy.abort);
  }
}

class _$TripsRepository extends TripsRepository {
  _$TripsRepository(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _tripEntityInsertionAdapter = InsertionAdapter(
            database,
            'trip',
            (TripEntity item) => <String, Object?>{
                  'trip_id': _iDConverter.encode(item.tripId),
                  'route_id': _iDConverter.encode(item.routeId),
                  'service_id': _iDConverter.encode(item.serviceId),
                  'trip_headsign': item.tripHeadsign,
                  'trip_short_name': item.tripShortName,
                  'direction_id': item.directionId?.index,
                  'block_id': _nullableIDConverter.encode(item.blockId),
                  'shape_id': _nullableIDConverter.encode(item.shapeId),
                  'wheelchair_accessible': item.wheelchairAccessible?.index,
                  'bikes_allowed': item.bikesAllowed?.index
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TripEntity> _tripEntityInsertionAdapter;

  @override
  Future<List<TripEntity>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM trips',
        mapper: (Map<String, Object?> row) => TripEntity(
            _iDConverter.decode(row['trip_id'] as String),
            _iDConverter.decode(row['route_id'] as String),
            _iDConverter.decode(row['service_id'] as String),
            row['trip_headsign'] as String?,
            row['trip_short_name'] as String?,
            row['direction_id'] == null
                ? null
                : DirectionId.values[row['direction_id'] as int],
            _nullableIDConverter.decode(row['block_id'] as String?),
            _nullableIDConverter.decode(row['shape_id'] as String?),
            row['wheelchair_accessible'] == null
                ? null
                : WheelchairAccessible
                    .values[row['wheelchair_accessible'] as int],
            row['bikes_allowed'] == null
                ? null
                : BikesAllowed.values[row['bikes_allowed'] as int]));
  }

  @override
  Future<List<int>> insertAll(List<TripEntity> trips) {
    return _tripEntityInsertionAdapter.insertListAndReturnIds(
        trips, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _emailConverter = EmailConverter();
final _iDConverter = IDConverter();
final _phoneNumberConverter = PhoneNumberConverter();
final _urlConverter = UrlConverter();
final _dateConverter = DateConverter();
final _languageCodeConverter = LanguageCodeConverter();
final _timezoneConverter = TimezoneConverter();
final _currencyCodeConverter = CurrencyCodeConverter();
final _timeConverter = TimeConverter();
final _nullableEmailConverter = NullableEmailConverter();
final _nullableIDConverter = NullableIDConverter();
final _nullablePhoneNumberConverter = NullablePhoneNumberConverter();
final _nullableUrlConverter = NullableUrlConverter();
final _nullableDateConverter = NullableDateConverter();
final _nullableLanguageCodeConverter = NullableLanguageCodeConverter();
final _nullableTimezoneConverter = NullableTimezoneConverter();
final _nullableCurrencyCodeConverter = NullableCurrencyCodeConverter();
final _nullableTimeConverter = NullableTimeConverter();
