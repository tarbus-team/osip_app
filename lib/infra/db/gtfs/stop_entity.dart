import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/enum/location_type.dart';
import 'package:osip_app/infra/db/gtfs/enum/wheelchair_boarding.dart';
import 'package:osip_app/shared/vo/id.dart';
import 'package:osip_app/shared/vo/timezone.dart';
import 'package:osip_app/shared/vo/url.dart';

@Entity(
  tableName: 'stops',
  foreignKeys: [
    ForeignKey(
      childColumns: ['parent_station'],
      parentColumns: ['stop_id'],
      entity: StopEntity,
    ),
  ],
)
class StopEntity extends Equatable {
  @PrimaryKey()
  @ColumnInfo(name: 'stop_id')
  final ID stopId;

  @ColumnInfo(name: 'stop_code')
  final String? stopCode;

  @ColumnInfo(name: 'stop_name')
  final String stopName;

  @ColumnInfo(name: 'stop_desc')
  final String? stopDesc;

  @ColumnInfo(name: 'stop_lat')
  final double stopLat;

  @ColumnInfo(name: 'stop_lon')
  final double stopLon;

  @ColumnInfo(name: 'zone_id')
  final ID? zoneId;

  @ColumnInfo(name: 'stop_url')
  final URL? stopUrl;

  @ColumnInfo(name: 'location_type')
  final LocationType? locationType;

  @ColumnInfo(name: 'parent_station')
  final ID? parentStation;

  @ColumnInfo(name: 'stop_timezone')
  final Timezone? stopTimezone;

  @ColumnInfo(name: 'wheelchair_boarding')
  final WheelchairBoarding? wheelchairBoarding;

  @ColumnInfo(name: 'level_id')
  final ID? levelId;

  @ColumnInfo(name: 'platform_code')
  final String? platformCode;

  const StopEntity(
    this.stopId,
    this.stopCode,
    this.stopName,
    this.stopDesc,
    this.stopLat,
    this.stopLon,
    this.zoneId,
    this.stopUrl,
    this.locationType,
    this.parentStation,
    this.stopTimezone,
    this.wheelchairBoarding,
    this.levelId,
    this.platformCode,
  );
  
  factory StopEntity.fromJson(Map<String, dynamic> json) {
    return StopEntity(
      ID(json['stop_id'].toString()),
      json['stop_code'].toString(),
      json['stop_name'],
      json['stop_desc'],
      json['stop_lat'],
      json['stop_lon'],
      json['zone_id'] != null ? ID(json['zone_id']) : null,
      json['stop_url'] != null ? URL(json['stop_url']) : null,
      json['location_type'] != null && json['location_type'].toString().isNotEmpty ? LocationType.values[json['location_type']] : null,
      json['parent_station'] != null && json['parent_station'].toString().isNotEmpty ? ID(json['parent_station']) : null,
      json['stop_timezone'] != null ? Timezone(json['stop_timezone']) : null,
      json['wheelchair_boarding'] != null && json['wheelchair_boarding'].toString().isNotEmpty ? WheelchairBoarding.values[json['wheelchair_boarding']] : null,
      json['level_id'] != null ? ID(json['level_id']) : null,
      json['platform_code'],
    );
  }
  
  @override
  List<Object?> get props => [
        stopId,
        stopCode,
        stopName,
        stopDesc,
        stopLat,
        stopLon,
        zoneId,
        stopUrl,
        locationType,
        parentStation,
        stopTimezone,
        wheelchairBoarding,
        levelId,
        platformCode,
      ];
}
