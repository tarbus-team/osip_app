import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/calendar_date_entity.dart';
import 'package:osip_app/infra/db/gtfs/calendar_entity.dart';
import 'package:osip_app/infra/db/gtfs/stop_entity.dart';

@dao
abstract class CalendarRepository {
  @Query('SELECT * FROM calendar')
  Future<List<CalendarEntity>> findAll();
  
  @Insert()
  Future<List<int>> insertAll(List<CalendarEntity> calendars);
}