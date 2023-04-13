import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/agency_entity.dart';
import 'package:osip_app/infra/db/gtfs/enum/continuous_drop_off.dart';
import 'package:osip_app/infra/db/gtfs/enum/continuous_pickup.dart';
import 'package:osip_app/infra/db/gtfs/enum/route_type.dart';
import 'package:osip_app/shared/vo/id.dart';
import 'package:osip_app/shared/vo/url.dart';

@Entity(
  tableName: 'routes',
  foreignKeys: [
    ForeignKey(
      childColumns: ['agency_id'],
      parentColumns: ['agency_id'],
      entity: AgencyEntity,
    )
  ],
)
class RouteEntity extends Equatable {
  @PrimaryKey()
  @ColumnInfo(name: 'route_id')
  final ID routeId;

  @ColumnInfo(name: 'agency_id')
  
  final ID? agencyId;

  @ColumnInfo(name: 'route_short_name')
  final String? routeShortName;

  @ColumnInfo(name: 'route_long_name')
  final String? routeLongName;

  @ColumnInfo(name: 'route_desc')
  final String? routeDesc;

  @ColumnInfo(name: 'route_type')
  final RouteType routeType;

  @ColumnInfo(name: 'route_url')
  final URL? routeUrl;

  @ColumnInfo(name: 'route_color')
  final String? routeColor;

  @ColumnInfo(name: 'route_text_color')
  final String? routeTextColor;

  @ColumnInfo(name: 'route_sort_order')
  final int? routeSortOrder;

  @ColumnInfo(name: 'continuous_pickup')
  final ContinuousPickup? continuousPickup;

  @ColumnInfo(name: 'continuous_drop_off')
  final ContinuousDropOff? continuousDropOff;

  const RouteEntity(
    this.routeId,
    this.agencyId,
    this.routeShortName,
    this.routeLongName,
    this.routeDesc,
    this.routeType,
    this.routeUrl,
    this.routeColor,
    this.routeTextColor,
    this.routeSortOrder,
    this.continuousPickup,
    this.continuousDropOff,
  );

  factory RouteEntity.fromJson(Map<String, dynamic> json) {
    return RouteEntity(
      ID(json['route_id'].toString()),
      json['agency_id'] != null ? ID(json['agency_id'].toString()) : null,
      json['route_short_name'],
      json['route_long_name'],
      json['route_desc'],
      RouteType.values[json['route_type']],
      json['route_url'] != null ? URL(json['route_url']) : null,
      json['route_color'].toString(),
      json['route_text_color'].toString(),
      json['route_sort_order'],
      json['continuous_pickup'] != null ? ContinuousPickup.values[json['continuous_pickup']] : null,
      json['continuous_drop_off'] != null ? ContinuousDropOff.values[json['continuous_drop_off']] : null,
    );
  }

  @override
  List<Object?> get props => [
        routeId,
        agencyId,
        routeShortName,
        routeLongName,
        routeDesc,
        routeType,
        routeUrl,
        routeColor,
        routeTextColor,
        routeSortOrder,
        continuousPickup,
        continuousDropOff,
      ];
}
