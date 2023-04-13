import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/fare_attribute_entity.dart';
import 'package:osip_app/infra/db/gtfs/fare_rule_entity.dart';
import 'package:osip_app/infra/db/gtfs/feed_info_entity.dart';

@dao
abstract class FeedInfoRepository {
  @Query('SELECT * FROM feed_info')
  Future<List<FeedInfoEntity>> findAll();

  @Insert()
  Future<List<int>> insertAll(List<FeedInfoEntity> feedInfos);
}
