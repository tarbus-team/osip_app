import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/enum/bikes_allowed.dart';
import 'package:osip_app/infra/db/gtfs/enum/direction_id.dart';
import 'package:osip_app/infra/db/gtfs/enum/wheelchair_accessible.dart';
import 'package:osip_app/infra/db/gtfs/route_entity.dart';
import 'package:osip_app/shared/vo/id.dart';

@Entity(
  tableName: 'trip',
  foreignKeys: [
    ForeignKey(
      childColumns: ['route_id'],
      parentColumns: ['route_id'],
      entity: RouteEntity,
    ),
  ],
)
class TripEntity extends Equatable {
  @PrimaryKey()
  @ColumnInfo(name: 'trip_id')
  final ID tripId;
  
  @ColumnInfo(name: 'route_id')
  final ID routeId;
  
  @ColumnInfo(name: 'service_id')
  final ID serviceId;
  
  @ColumnInfo(name: 'trip_headsign')
  final String? tripHeadsign;
  
  @ColumnInfo(name: 'trip_short_name')
  final String? tripShortName;
  
  @ColumnInfo(name: 'direction_id')
  final DirectionId? directionId;
  
  @ColumnInfo(name: 'block_id')
  final ID? blockId;
  
  @ColumnInfo(name: 'shape_id')
  final ID? shapeId;
  
  @ColumnInfo(name: 'wheelchair_accessible')
  final WheelchairAccessible? wheelchairAccessible;
  
  @ColumnInfo(name: 'bikes_allowed')
  final BikesAllowed? bikesAllowed;
  
  const TripEntity(
    this.tripId,
    this.routeId,
    this.serviceId,
    this.tripHeadsign,
    this.tripShortName,
    this.directionId,
    this.blockId,
    this.shapeId,
    this.wheelchairAccessible,
    this.bikesAllowed,
  );
  
  factory TripEntity.fromJson(Map<String, dynamic> json) {
    return TripEntity(
      ID(json['trip_id'].toString()),
      ID(json['route_id'].toString()),
      ID(json['service_id'].toString()),
      json['trip_headsign'],
      json['trip_short_name'],
      DirectionId.values[json['direction_id']],
      json['block_id'] != null ? ID(json['block_id'.toString()]) : null,
      json['shape_id'] != null ? ID(json['shape_id'].toString()) : null,
      json['wheelchair_accessible'] != null ? WheelchairAccessible.values[json['wheelchair_accessible']] : null,
      json['bikes_allowed'] != null ? BikesAllowed.values[json['bikes_allowed']] : null,
    );
  }
  
  @override
  List<Object?> get props => [
    tripId,
    routeId,
    serviceId,
    tripHeadsign,
    tripShortName,
    directionId,
    blockId,
    shapeId,
    wheelchairAccessible,
    bikesAllowed,
  ];
}
