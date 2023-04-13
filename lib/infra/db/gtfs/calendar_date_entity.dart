import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/enum/service_exception_type.dart';
import 'package:osip_app/shared/vo/date.dart';
import 'package:osip_app/shared/vo/id.dart';

@Entity(
  tableName: 'calendar_dates',
)
class CalendarDateEntity extends Equatable {
  @PrimaryKey()
  @ColumnInfo(name: 'service_id')
  final ID serviceId;

  @ColumnInfo(name: 'date')
  final Date date;

  @ColumnInfo(name: 'exception_type')
  final ServiceExceptionType? exceptionType;

  const CalendarDateEntity(
    this.serviceId,
    this.date,
    this.exceptionType,
  );

  factory CalendarDateEntity.fromJson(Map<String, dynamic> json) {
    return CalendarDateEntity(
      ID(json['service_id']),
      Date(json['date'].toString()),
      json['exception_type'] != null ? ServiceExceptionType.values[json['exception_type']] : null,
    );
  }

  @override
  List<Object?> get props => [serviceId, date, exceptionType];
}
