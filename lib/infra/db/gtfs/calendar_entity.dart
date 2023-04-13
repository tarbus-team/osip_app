import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/enum/service_availability.dart';
import 'package:osip_app/shared/vo/date.dart';
import 'package:osip_app/shared/vo/id.dart';

@Entity(
  tableName: 'calendar',
)
class CalendarEntity extends Equatable {
  @PrimaryKey()
  @ColumnInfo(name: 'service_id')
  final ID serviceId;

  @ColumnInfo(name: 'monday')
  final ServiceAvailability monday;

  @ColumnInfo(name: 'tuesday')
  final ServiceAvailability tuesday;

  @ColumnInfo(name: 'wednesday')
  final ServiceAvailability wednesday;

  @ColumnInfo(name: 'thursday')
  final ServiceAvailability thursday;

  @ColumnInfo(name: 'friday')
  final ServiceAvailability friday;

  @ColumnInfo(name: 'saturday')
  final ServiceAvailability saturday;

  @ColumnInfo(name: 'sunday')
  final ServiceAvailability sunday;

  @ColumnInfo(name: 'start_date')
  final Date startDate;

  @ColumnInfo(name: 'end_date')
  final Date endDate;

  const CalendarEntity(
    this.serviceId,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.startDate,
    this.endDate,
  );
  
  factory CalendarEntity.fromJson(Map<String, dynamic> json) {
    return CalendarEntity(
      ID(json['service_id'].toString()),
      ServiceAvailability.values[json['monday']],
      ServiceAvailability.values[json['tuesday']],
      ServiceAvailability.values[json['wednesday']],
      ServiceAvailability.values[json['thursday']],
      ServiceAvailability.values[json['friday']],
      ServiceAvailability.values[json['saturday']],
      ServiceAvailability.values[json['sunday']],
      Date(json['start_date'].toString()),
      Date(json['end_date'].toString()),
    );
  }
  
  @override
  List<Object?> get props => [
    serviceId,
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    sunday,
    startDate,
    endDate,
  ];
}
