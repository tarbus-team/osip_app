import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/shared/vo/id.dart';

@Entity(
  tableName: 'levels',
)
class LevelEntity extends Equatable {
  @PrimaryKey()
  @ColumnInfo(name: 'level_id')
  final ID levelId;
  
  @ColumnInfo(name: 'level_index')
  final double levelIndex;
  
  @ColumnInfo(name: 'level_name')
  final String? levelName;
  
  const LevelEntity(
    this.levelId,
    this.levelIndex,
    this.levelName,
  );
  
  factory LevelEntity.fromJson(Map<String, dynamic> json) {
    return LevelEntity(
      ID(json['level_id']),
      json['level_index'],
      json['level_name'],
    );
  }
  
  @override
  List<Object?> get props => [levelId, levelIndex, levelName];
}
