import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/fare_attribute_entity.dart';

@dao
abstract class FareAttributesRepository {
  @Query('SELECT * FROM fare_attributes')
  Future<List<FareAttributeEntity>> findAll();
  
  @Insert()
  Future<List<int>> insertAll(List<FareAttributeEntity> fareAttributes);
}