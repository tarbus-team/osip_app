import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/fare_attribute_entity.dart';
import 'package:osip_app/infra/db/gtfs/fare_rule_entity.dart';

@dao
abstract class FareRulesRepository {
  @Query('SELECT * FROM fare_rules')
  Future<List<FareRuleEntity>> findAll();
  
  @Insert()
  Future<List<int>> insertAll(List<FareRuleEntity> fareRules);
}