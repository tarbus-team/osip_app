import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/agency_entity.dart';
import 'package:osip_app/infra/db/gtfs/stop_entity.dart';

@dao
abstract class AgencyRepository {
  @Query('SELECT * FROM agency')
  Future<List<AgencyEntity>> findAll();
  
  @Insert()
  Future<List<int>> insertAll(List<AgencyEntity> agencyEntityList);
}