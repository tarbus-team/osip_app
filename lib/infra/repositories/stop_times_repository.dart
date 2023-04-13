import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/stop_time_entity.dart';

@dao
abstract class StopTimesRepository {
  @Query('SELECT * FROM stop_times')
  Future<List<StopTimeEntity>> findAll();
  
  @Query('SELECT COUNT(*) FROM stop_times')
  Future<int?> findSize();

  @Insert()
  Future<List<int>> insertAll(List<StopTimeEntity> stopTimes);
}