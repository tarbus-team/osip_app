import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/fare_attribute_entity.dart';
import 'package:osip_app/infra/db/gtfs/fare_rule_entity.dart';
import 'package:osip_app/infra/db/gtfs/feed_info_entity.dart';
import 'package:osip_app/infra/db/gtfs/frequency_entity.dart';
import 'package:osip_app/infra/db/gtfs/level_entity.dart';
import 'package:osip_app/infra/db/gtfs/pathway_entity.dart';
import 'package:osip_app/infra/db/gtfs/route_entity.dart';
import 'package:osip_app/infra/db/gtfs/shape_entity.dart';

@dao
abstract class ShapesRepository {
  @Query('SELECT * FROM shapes')
  Future<List<ShapeEntity>> findAll();

  @Insert()
  Future<List<int>> insertAll(List<ShapeEntity> shapes);
}
