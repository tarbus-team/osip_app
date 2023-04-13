import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/shared/vo/id.dart';
import 'package:uuid/uuid.dart';

@Entity(
  tableName: 'shapes',
  primaryKeys: ['shape_id', 'shape_pt_sequence'],
)
class ShapeEntity extends Equatable {
  @ColumnInfo(name: 'shape_id')
  final ID shapeId;
  
  @ColumnInfo(name: 'shape_pt_lat')
  final double shapePtLat;
  
  @ColumnInfo(name: 'shape_pt_lon')
  final double shapePtLon;
  
  @ColumnInfo(name: 'shape_pt_sequence')
  final int shapePtSequence;
  
  @ColumnInfo(name: 'shape_dist_traveled')
  final double? shapeDistTraveled;
  
  const ShapeEntity(
    this.shapeId,
    this.shapePtLat,
    this.shapePtLon,
    this.shapePtSequence,
    this.shapeDistTraveled,
  );
  
  factory ShapeEntity.fromJson(Map<String, dynamic> json) {
    return ShapeEntity(
      ID(json['shape_id'].toString()),
      json['shape_pt_lat'],
      json['shape_pt_lon'],
      json['shape_pt_sequence'],
      json['shape_dist_traveled'],
    );
  }
  
  @override
  List<Object?> get props => [shapeId, shapePtLat, shapePtLon, shapePtSequence, shapeDistTraveled];
}
