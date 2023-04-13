import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/enum/continuous_drop_off.dart';
import 'package:osip_app/infra/db/gtfs/enum/continuous_pickup.dart';
import 'package:osip_app/infra/db/gtfs/enum/drop_off_type.dart';
import 'package:osip_app/infra/db/gtfs/enum/pickup_type.dart';
import 'package:osip_app/infra/db/gtfs/enum/timepoint.dart';
import 'package:osip_app/infra/db/gtfs/stop_entity.dart';
import 'package:osip_app/infra/db/gtfs/trip_entity.dart';
import 'package:osip_app/shared/vo/id.dart';
import 'package:osip_app/shared/vo/time.dart';
import 'package:uuid/uuid.dart';

@Entity(
  tableName: 'stop_times',
  foreignKeys: [
    ForeignKey(
      childColumns: ['trip_id'],
      parentColumns: ['trip_id'],
      entity: TripEntity,
    ),
    ForeignKey(
      childColumns: ['stop_id'],
      parentColumns: ['stop_id'],
      entity: StopEntity,
    ),
  ],
)
class StopTimeEntity extends Equatable {
  @PrimaryKey()
  final String id;

  @ColumnInfo(name: 'trip_id')
  final ID tripId;

  @ColumnInfo(name: 'arrival_time')
  final Time arrivalTime;

  @ColumnInfo(name: 'departure_time')
  final Time departureTime;

  @ColumnInfo(name: 'stop_id')
  final ID stopId;

  @ColumnInfo(name: 'stop_sequence')
  final int stopSequence;

  @ColumnInfo(name: 'stop_headsign')
  final String? stopHeadsign;

  @ColumnInfo(name: 'pickup_type')
  final PickupType? pickupType;

  @ColumnInfo(name: 'drop_off_type')
  final DropOffType? dropOffType;

  @ColumnInfo(name: 'continuous_pickup')
  final ContinuousPickup? continuousPickup;

  @ColumnInfo(name: 'continuous_drop_off')
  final ContinuousDropOff? continuousDropOff;

  @ColumnInfo(name: 'shape_dist_traveled')
  final double? shapeDistTraveled;

  @ColumnInfo(name: 'timepoint')
  final Timepoint? timepoint;

  const StopTimeEntity(
    this.id,
    this.tripId,
    this.arrivalTime,
    this.departureTime,
    this.stopId,
    this.stopSequence,
    this.stopHeadsign,
    this.pickupType,
    this.dropOffType,
    this.continuousPickup,
    this.continuousDropOff,
    this.shapeDistTraveled,
    this.timepoint,
  );
  
  factory StopTimeEntity.fromJson(Map<String, dynamic> json) {
    return StopTimeEntity(
      const Uuid().v4(),
      ID(json['trip_id'] as String),
      Time(json['arrival_time'] as String),
      Time(json['departure_time'] as String),
      ID(json['stop_id'].toString()),
      json['stop_sequence'] as int,
      json['stop_headsign'] as String?,
      json['pickup_type'] != null ? PickupType.values[json['pickup_type'] as int] : null,
      json['drop_off_type'] != null ? DropOffType.values[json['drop_off_type'] as int] : null,
      json['continuous_pickup'] != null ? ContinuousPickup.values[json['continuous_pickup'] as int] : null,
      json['continuous_drop_off'] != null ? ContinuousDropOff.values[json['continuous_drop_off'] as int] : null,
      json['shape_dist_traveled'] as double?,
      json['timepoint'] != null ? Timepoint.values[json['timepoint'] as int] : null,
    );
  }

  @override
  List<Object?> get props => [
        tripId,
        arrivalTime,
        departureTime,
        stopId,
        stopSequence,
        stopHeadsign,
        pickupType,
        dropOffType,
        continuousPickup,
        continuousDropOff,
        shapeDistTraveled,
        timepoint,
      ];
}
