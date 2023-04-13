import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/enum/exact_times.dart';
import 'package:osip_app/infra/db/gtfs/trip_entity.dart';
import 'package:osip_app/shared/vo/id.dart';
import 'package:osip_app/shared/vo/time.dart';

@Entity(
  tableName: 'frequencies',
  foreignKeys: [
    ForeignKey(
      childColumns: ['trip_id'],
      parentColumns: ['trip_id'],
      entity: TripEntity,
    ),
  ],
)
class FrequencyEntity extends Equatable {
  @PrimaryKey()
  @ColumnInfo(name: 'trip_id')
  final ID tripId;

  @ColumnInfo(name: 'start_time')
  final Time startTime;

  @ColumnInfo(name: 'end_time')
  final Time endTime;

  @ColumnInfo(name: 'headway_secs')
  final int headwaySecs;

  @ColumnInfo(name: 'exact_times')
  final ExactTimes? exactTimes;

  const FrequencyEntity(
    this.tripId,
    this.startTime,
    this.endTime,
    this.headwaySecs,
    this.exactTimes,
  );
  
  factory FrequencyEntity.fromJson(Map<String, dynamic> json) {
    return FrequencyEntity(
      ID(json['trip_id']),
      Time(json['start_time']),
      Time(json['end_time']),
      json['headway_secs'],
      ExactTimes.values[json['exact_times']],
    );
  }

  @override
  List<Object?> get props => [tripId, startTime, endTime, headwaySecs, exactTimes];
}
