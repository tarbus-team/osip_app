import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/agency_entity.dart';
import 'package:osip_app/infra/db/gtfs/attribution_entity.dart';
import 'package:osip_app/infra/db/gtfs/calendar_date_entity.dart';
import 'package:osip_app/infra/db/gtfs/calendar_entity.dart';
import 'package:osip_app/infra/db/gtfs/enum/bikes_allowed.dart';
import 'package:osip_app/infra/db/gtfs/enum/direction_id.dart';
import 'package:osip_app/infra/db/gtfs/enum/exact_times.dart';
import 'package:osip_app/infra/db/gtfs/enum/location_type.dart';
import 'package:osip_app/infra/db/gtfs/enum/pathway_mode.dart';
import 'package:osip_app/infra/db/gtfs/enum/payment_method.dart';
import 'package:osip_app/infra/db/gtfs/enum/route_type.dart';
import 'package:osip_app/infra/db/gtfs/enum/service_availability.dart';
import 'package:osip_app/infra/db/gtfs/enum/service_exception_type.dart';
import 'package:osip_app/infra/db/gtfs/enum/transfer_type.dart';
import 'package:osip_app/infra/db/gtfs/enum/transfers.dart';
import 'package:osip_app/infra/db/gtfs/enum/wheelchair_accessible.dart';
import 'package:osip_app/infra/db/gtfs/enum/wheelchair_boarding.dart';
import 'package:osip_app/infra/db/gtfs/fare_attribute_entity.dart';
import 'package:osip_app/infra/db/gtfs/fare_rule_entity.dart';
import 'package:osip_app/infra/db/gtfs/feed_info_entity.dart';
import 'package:osip_app/infra/db/gtfs/frequency_entity.dart';
import 'package:osip_app/infra/db/gtfs/level_entity.dart';
import 'package:osip_app/infra/db/gtfs/pathway_entity.dart';
import 'package:osip_app/infra/db/gtfs/route_entity.dart';
import 'package:osip_app/infra/db/gtfs/shape_entity.dart';
import 'package:osip_app/infra/db/gtfs/stop_entity.dart';
import 'package:osip_app/infra/db/gtfs/stop_time_entity.dart';
import 'package:osip_app/infra/db/gtfs/transfer_entity.dart';
import 'package:osip_app/infra/db/gtfs/trip_entity.dart';
import 'package:osip_app/infra/repositories/agency_repository.dart';
import 'package:osip_app/infra/repositories/attributions_repository.dart';
import 'package:osip_app/infra/repositories/calendar_dates_repository.dart';
import 'package:osip_app/infra/repositories/calendar_repository.dart';
import 'package:osip_app/infra/repositories/fare_attributes_repository.dart';
import 'package:osip_app/infra/repositories/fare_rules_repository.dart';
import 'package:osip_app/infra/repositories/feed_info_repository.dart';
import 'package:osip_app/infra/repositories/frequencies_repository.dart';
import 'package:osip_app/infra/repositories/levels_repository.dart';
import 'package:osip_app/infra/repositories/pathways_repository.dart';
import 'package:osip_app/infra/repositories/routes_repository.dart';
import 'package:osip_app/infra/repositories/shapes_repository.dart';
import 'package:osip_app/infra/repositories/stop_times_repository.dart';
import 'package:osip_app/infra/repositories/stops_repository.dart';
import 'package:osip_app/infra/repositories/transfers_repository.dart';
import 'package:osip_app/infra/repositories/trips_repository.dart';
import 'package:osip_app/shared/vo/type_converters.dart';

import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'gtfs/enum/continuous_drop_off.dart';
import 'gtfs/enum/continuous_pickup.dart';
import 'gtfs/enum/drop_off_type.dart';
import 'gtfs/enum/pickup_type.dart';
import 'gtfs/enum/timepoint.dart';

part 'gtfs_database.g.dart'; 

@TypeConverters([
  EmailConverter,
  IDConverter,
  PhoneNumberConverter,
  UrlConverter,
  DateConverter,
  LanguageCodeConverter,
  TimezoneConverter,
  CurrencyCodeConverter,
  TimeConverter,
  //
  NullableEmailConverter,
  NullableIDConverter,
  NullablePhoneNumberConverter,
  NullableUrlConverter,
  NullableDateConverter,
  NullableLanguageCodeConverter,
  NullableTimezoneConverter,
  NullableCurrencyCodeConverter,
  NullableTimeConverter,
])
@Database(
  version: 1,
  entities: [
    AgencyEntity,
    AttributionEntity,
    CalendarDateEntity,
    CalendarEntity,
    FareAttributeEntity,
    FareRuleEntity,
    FeedInfoEntity,
    FrequencyEntity,
    LevelEntity,
    PathwayEntity,
    RouteEntity,
    ShapeEntity,
    StopEntity,
    StopTimeEntity,
    TransferEntity,
    TripEntity,
  ],
)

abstract class GtfsDatabase extends FloorDatabase {
  AgencyRepository get agencyRepository;
  AttributionsRepository get attributionsRepository;
  CalendarDatesRepository get calendarDatesRepository;
  CalendarRepository get calendarRepository;
  FareAttributesRepository get fareAttributesRepository;
  FareRulesRepository get fareRulesRepository;
  FeedInfoRepository get feedInfoRepository;
  FrequenciesRepository get frequenciesRepository;
  LevelsRepository get levelsRepository;
  PathwaysRepository get pathwaysRepository;
  RoutesRepository get routesRepository;
  ShapesRepository get shapesRepository;
  StopTimesRepository get stopTimesRepository;
  StopsRepository get stopsRepository;
  TransfersRepository get transfersRepository;
  TripsRepository get tripsRepository;
}

late GtfsDatabase gtfsDatabase;

Future<void> initGtfsDatabase() async {
  gtfsDatabase = await $FloorGtfsDatabase.databaseBuilder('gtfs_database.db').build();
}
