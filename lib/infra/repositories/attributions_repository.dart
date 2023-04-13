import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/agency_entity.dart';
import 'package:osip_app/infra/db/gtfs/attribution_entity.dart';
import 'package:osip_app/infra/db/gtfs/stop_entity.dart';

@dao
abstract class AttributionsRepository {
  @Query('SELECT * FROM attributions')
  Future<List<AttributionEntity>> findAll();
  
  @Insert()
  Future<List<int>> insertAll(List<AttributionEntity> attributionEntityList);
}