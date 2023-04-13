import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/fare_attribute_entity.dart';
import 'package:osip_app/infra/db/gtfs/fare_rule_entity.dart';
import 'package:osip_app/infra/db/gtfs/feed_info_entity.dart';
import 'package:osip_app/infra/db/gtfs/frequency_entity.dart';

@dao
abstract class FrequenciesRepository {
  @Query('SELECT * FROM frequencies')
  Future<List<FrequencyEntity>> findAll();

  @Insert()
  Future<List<int>> insertAll(List<FrequencyEntity> frequencies);
}
