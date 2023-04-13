import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/fare_attribute_entity.dart';
import 'package:osip_app/infra/db/gtfs/fare_rule_entity.dart';
import 'package:osip_app/infra/db/gtfs/feed_info_entity.dart';
import 'package:osip_app/infra/db/gtfs/frequency_entity.dart';
import 'package:osip_app/infra/db/gtfs/level_entity.dart';
import 'package:osip_app/infra/db/gtfs/pathway_entity.dart';
import 'package:osip_app/infra/db/gtfs/route_entity.dart';

@dao
abstract class RoutesRepository {
  @Query('SELECT * FROM routes')
  Future<List<RouteEntity>> findAll();

  @Insert()
  Future<List<int>> insertAll(List<RouteEntity> routes);
}
