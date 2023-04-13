import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:osip_app/infra/db/gtfs/agency_entity.dart';
import 'package:osip_app/infra/db/gtfs/attribution_entity.dart';
import 'package:osip_app/infra/db/gtfs/calendar_date_entity.dart';
import 'package:osip_app/infra/db/gtfs/calendar_entity.dart';
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
import 'package:osip_app/infra/db/gtfs_database.dart';
import 'package:osip_app/shared/utils/file_utils.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  Future<void> init() async {
    // List<String> pairs = [
    //   'agency',
    //   'routes',
    //   'calendar_dates',
    //   'calendar',
    //   'fare_attributes',
    //   'trips',
    //   'attributions',
    //   'fare_rules',
    //   'feed_info',
    //   'frequencies',
    //   'levels',
    //   'pathways',
    //   'shapes',
    //   'stops',
    //   'stop_times',
    //   'transfers',
    // ];
    //
    // for (String key in pairs) {
    //   String? gtfs = await FileUtils.getAssetFileContent('assets/gtfs/$key.txt');
    //   if (gtfs == null) {
    //     continue;
    //   }
    //
    //   switch (key) {
    //     case 'agency':
    //       List<AgencyEntity> saveAgencies = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.agencyRepository.insertAll(saveAgencies);
    //       print('insert AGENCY');
    //       break;
    //     case 'attributions':
    //       List<AttributionEntity> saveAttributions = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.attributionsRepository.insertAll(saveAttributions);
    //       break;
    //     case 'calendar_dates':
    //       List<CalendarDateEntity> saveCalendarDates = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.calendarDatesRepository.insertAll(saveCalendarDates);
    //       break;
    //     case 'calendar':
    //       List<CalendarEntity> saveCalendars = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.calendarRepository.insertAll(saveCalendars);
    //       break;
    //     case 'fare_attributes':
    //       List<FareAttributeEntity> saveFareAttributes = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.fareAttributesRepository.insertAll(saveFareAttributes);
    //       break;
    //     case 'fare_rules':
    //       List<FareRuleEntity> saveFareRules = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.fareRulesRepository.insertAll(saveFareRules);
    //       break;
    //     case 'feed_info':
    //       List<FeedInfoEntity> saveFeedInfos = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.feedInfoRepository.insertAll(saveFeedInfos);
    //       break;
    //     case 'frequencies':
    //       List<FrequencyEntity> saveFrequencies = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.frequenciesRepository.insertAll(saveFrequencies);
    //       break;
    //     case 'levels':
    //       List<LevelEntity> saveLevels = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.levelsRepository.insertAll(saveLevels);
    //       break;
    //     case 'pathways':
    //       List<PathwayEntity> savePathways = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.pathwaysRepository.insertAll(savePathways);
    //       break;
    //     case 'routes':
    //       List<RouteEntity> saveRoutes = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.routesRepository.insertAll(saveRoutes);
    //       break;
    //     case 'shapes':
    //       List<ShapeEntity> saveShapes = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.shapesRepository.insertAll(saveShapes);
    //       break;
    //     case 'stops':
    //       List<StopEntity> saveStops = await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.stopsRepository.insertAll(saveStops);
    //       break;
    //     case 'stop_times':
    //       List<StopTimeEntity> saveStopTimes = await compute(insertToDatabase, [gtfs, key]);
    //       for(int i = 0; i < saveStopTimes.length; i += 1000) {
    //         if( i + 1000 > saveStopTimes.length) {
    //           await gtfsDatabase.stopTimesRepository.insertAll(saveStopTimes.sublist(i, saveStopTimes.length));
    //         } else {
    //           await gtfsDatabase.stopTimesRepository.insertAll(saveStopTimes.sublist(i, i + 1000));
    //         }
    //       }
    //     
    //       break;
    //     case 'transfers':
    //       List<TransferEntity> saveTransfers =  await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.transfersRepository.insertAll(saveTransfers);
    //       break;
    //     case 'trips':
    //       List<TripEntity> saveTrips =  await compute(insertToDatabase, [gtfs, key]);
    //       await gtfsDatabase.tripsRepository.insertAll(saveTrips);
    //       break;
    //   }
    // }
    
    // print('Stops: ${ (await gtfsDatabase.stopTimesRepository.findSize())}');
    // print('done');
  }
}

Future<List<T>> insertToDatabase<T>(List<String> nothing) async {
  String gtfs = nothing[0];
  String key = nothing[1];
  List<List<dynamic>> rowsAsListOfValues = const CsvToListConverter().convert(gtfs);
  List<String> headers = rowsAsListOfValues.removeAt(0).cast<String>();
  List<Map<String, dynamic>> map = rowsAsListOfValues.map((List<dynamic> row) => Map.fromIterables(headers, row)).toList();

  switch (key) {
    case 'agency':
      return map.map((Map<String, dynamic> row) => AgencyEntity.fromJson(row)).toList() as List<T>;
    case 'attributions':
      return map.map((Map<String, dynamic> row) => AttributionEntity.fromJson(row)).toList() as List<T>;
    case 'calendar_dates':
      return map.map((Map<String, dynamic> row) => CalendarDateEntity.fromJson(row)).toList() as List<T>;
    case 'calendar':
      return map.map((Map<String, dynamic> row) => CalendarEntity.fromJson(row)).toList() as List<T>;
    case 'fare_attributes':
      return map.map((Map<String, dynamic> row) => FareAttributeEntity.fromJson(row)).toList() as List<T>;
    case 'fare_rules':
      return map.map((Map<String, dynamic> row) => FareRuleEntity.fromJson(row)).toList() as List<T>;
    case 'feed_info':
      return map.map((Map<String, dynamic> row) => FeedInfoEntity.fromJson(row)).toList() as List<T>;
    case 'frequencies':
      return map.map((Map<String, dynamic> row) => FrequencyEntity.fromJson(row)).toList() as List<T>;
    case 'levels':
      return map.map((Map<String, dynamic> row) => LevelEntity.fromJson(row)).toList() as List<T>;
    case 'pathways':
      return map.map((Map<String, dynamic> row) => PathwayEntity.fromJson(row)).toList() as List<T>;
    case 'routes':
      return map.map((Map<String, dynamic> row) => RouteEntity.fromJson(row)).toList() as List<T>;
    case 'shapes':
      return map.map((Map<String, dynamic> row) => ShapeEntity.fromJson(row)).toList() as List<T>;
    case 'stops':
      return map.map((Map<String, dynamic> row) => StopEntity.fromJson(row)).toList() as List<T>;
    case 'stop_times':
      return map.map((Map<String, dynamic> row) => StopTimeEntity.fromJson(row)).toList() as List<T>;
    case 'transfers':
      return map.map((Map<String, dynamic> row) => TransferEntity.fromJson(row)).toList() as List<T>;
    case 'trips':
      return map.map((Map<String, dynamic> row) => TripEntity.fromJson(row)).toList() as List<T>;
  }
  throw Exception('Unknown key: $key');
}
