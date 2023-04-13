import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/stop_entity.dart';

@dao
abstract class StopsRepository {
  @Query('SELECT * FROM stops')
  Future<List<StopEntity>> findAll();
  
  @Insert()
  Future<List<int>> insertAll(List<StopEntity> stops);
}