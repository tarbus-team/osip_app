import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/enum/transfer_type.dart';
import 'package:osip_app/infra/db/gtfs/stop_entity.dart';
import 'package:osip_app/shared/vo/id.dart';

@Entity(
  tableName: 'transfers',
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
class TransferEntity extends Equatable {
  @PrimaryKey()
  final String id;

  @ColumnInfo(name: 'from_stop_id')
  final ID fromStopId;

  @ColumnInfo(name: 'to_stop_id')
  final ID toStopId;

  @ColumnInfo(name: 'transfer_type')
  final TransferType transferType;

  @ColumnInfo(name: 'min_transfer_time')
  final int? minTransferTime;

  const TransferEntity(
    this.id,
    this.fromStopId,
    this.toStopId,
    this.transferType,
    this.minTransferTime,
  );
  
  factory TransferEntity.fromJson(Map<String, dynamic> json) {
    return TransferEntity(
      json['id'],
      ID(json['from_stop_id']),
      ID(json['to_stop_id']),
      TransferType.values[json['transfer_type']],
      json['min_transfer_time'],
    );
  }

  @override
  List<Object?> get props => [fromStopId, toStopId, transferType, minTransferTime];
}
