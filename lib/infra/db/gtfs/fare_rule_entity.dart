import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/fare_attribute_entity.dart';
import 'package:osip_app/infra/db/gtfs/route_entity.dart';
import 'package:osip_app/infra/db/gtfs/stop_entity.dart';
import 'package:osip_app/shared/vo/id.dart';

@Entity(
  tableName: 'fare_rules',
  foreignKeys: [
    ForeignKey(
      childColumns: ['fare_id'],
      parentColumns: ['fare_id'],
      entity: FareAttributeEntity,
    ),
    ForeignKey(
      childColumns: ['route_id'],
      parentColumns: ['route_id'],
      entity: RouteEntity,
    ),
    ForeignKey(
      childColumns: ['origin_id'],
      parentColumns: ['zone_id'],
      entity: StopEntity,
    ),
    ForeignKey(
      childColumns: ['destination_id'],
      parentColumns: ['zone_id'],
      entity: StopEntity,
    ),
    ForeignKey(
      childColumns: ['contains_id'],
      parentColumns: ['zone_id'],
      entity: StopEntity,
    ),
  ],
)
class FareRuleEntity extends Equatable {
  @PrimaryKey()
  final String id;

  @ColumnInfo(name: 'fare_id')
  final ID fareId;
  
  @ColumnInfo(name: 'route_id')
  final ID? routeId;
  
  @ColumnInfo(name: 'origin_id')
  final ID? originId;
  
  @ColumnInfo(name: 'destination_id')
  final ID? destinationId;
  
  @ColumnInfo(name: 'contains_id')
  final ID? containsId;
  
  const FareRuleEntity(
    this.id,
    this.fareId,
    this.routeId,
    this.originId,
    this.destinationId,
    this.containsId,
  );
  
  factory FareRuleEntity.fromJson(Map<String, dynamic> json) {
    return FareRuleEntity(
      json['id'],
      ID(json['fare_id']),
      json['route_id'] != null ? ID(json['route_id']) : null,
      json['origin_id'] != null ? ID(json['origin_id']) : null,
      json['destination_id'] != null ? ID(json['destination_id']) : null,
      json['contains_id'] != null ? ID(json['contains_id']) : null,
    );
  }
  
  @override
  List<Object?> get props => [id, fareId, routeId, originId, destinationId, containsId];
}
