import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/calendar_date_entity.dart';
import 'package:osip_app/infra/db/gtfs/stop_entity.dart';

@dao
abstract class CalendarDatesRepository {
  @Query('SELECT * FROM calendar_dates')
  Future<List<CalendarDateEntity>> findAll();
  
  @Insert()
  Future<List<int>> insertAll(List<CalendarDateEntity> calendarDates);
}