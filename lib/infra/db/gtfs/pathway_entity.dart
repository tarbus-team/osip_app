import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/enum/pathway_mode.dart';
import 'package:osip_app/infra/db/gtfs/stop_entity.dart';
import 'package:osip_app/shared/vo/id.dart';

@Entity(
  tableName: 'pathways',
  foreignKeys: [
    ForeignKey(
      childColumns: ['from_stop_id'],
      parentColumns: ['stop_id'],
      entity: StopEntity,
    ),
    ForeignKey(
      childColumns: ['to_stop_id'],
      parentColumns: ['stop_id'],
      entity: StopEntity,
    ),
  ],
)
class PathwayEntity extends Equatable {
  @PrimaryKey()
  @ColumnInfo(name: 'pathway_id')
  final ID pathwayId;
  
  @ColumnInfo(name: 'from_stop_id')
  final ID fromStopId;

  @ColumnInfo(name: 'to_stop_id')
  final ID toStopId;

  @ColumnInfo(name: 'pathway_mode')
  final PathwayMode pathwayMode;
  
  @ColumnInfo(name: 'is_bidirectional')
  final bool isBidirectional;
  
  @ColumnInfo(name: 'length')
  final double? length;
  
  @ColumnInfo(name: 'traversal_time')
  final int? traversalTime;
  
  @ColumnInfo(name: 'stair_count')
  final int? stairCount;
  
  @ColumnInfo(name: 'max_slope')
  final double? maxSlope;
  
  @ColumnInfo(name: 'min_width')
  final double? minWidth;
  
  @ColumnInfo(name: 'signposted_as')
  final String? signpostedAs;
  
  @ColumnInfo(name: 'reversed_signposted_as')
  final String? reversedSignpostedAs;
  
  const PathwayEntity(
    this.pathwayId,
    this.fromStopId,
    this.toStopId,
    this.pathwayMode,
    this.isBidirectional,
    this.length,
    this.traversalTime,
    this.stairCount,
    this.maxSlope,
    this.minWidth,
    this.signpostedAs,
    this.reversedSignpostedAs,
  );
  
  factory PathwayEntity.fromJson(Map<String, dynamic> json) {
    return PathwayEntity(
      ID(json['pathway_id']),
      ID(json['from_stop_id']),
      ID(json['to_stop_id']),
      PathwayMode.values[json['pathway_mode']],
      json['is_bidirectional'] == 1,
      json['length'],
      json['traversal_time'],
      json['stair_count'],
      json['max_slope'],
      json['min_width'],
      json['signposted_as'],
      json['reversed_signposted_as'],
    );
  }
  
  @override
  List<Object?> get props => [
    pathwayId,
    fromStopId,
    toStopId,
    pathwayMode,
    isBidirectional,
    length,
    traversalTime,
    stairCount,
    maxSlope,
    minWidth,
    signpostedAs,
    reversedSignpostedAs,
  ];
}
