import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/agency_entity.dart';
import 'package:osip_app/infra/db/gtfs/route_entity.dart';
import 'package:osip_app/infra/db/gtfs/trip_entity.dart';
import 'package:osip_app/shared/vo/email.dart';
import 'package:osip_app/shared/vo/id.dart';
import 'package:osip_app/shared/vo/phone_number.dart';
import 'package:osip_app/shared/vo/url.dart';

@Entity(
  tableName: 'attributions',
  foreignKeys: [
    ForeignKey(
      childColumns: ['agency_id'],
      parentColumns: ['agency_id'],
      entity: AgencyEntity,
    ),
    ForeignKey(
      childColumns: ['route_id'],
      parentColumns: ['route_id'],
      entity: RouteEntity,
    ),
    ForeignKey(
      childColumns: ['trip_id'],
      parentColumns: ['trip_id'],
      entity: TripEntity,
    ),
  ],
)
class AttributionEntity extends Equatable {
  @PrimaryKey()
  @ColumnInfo(name: 'attribution_id')
  final ID attributionId;
  
  @ColumnInfo(name: 'agency_id')
  final ID? agencyId;
  
  @ColumnInfo(name: 'route_id')
  final ID? routeId;
  
  @ColumnInfo(name: 'trip_id')
  final ID? tripId;
  
  @ColumnInfo(name: 'organization_name')
  final String organizationName;
  
  @ColumnInfo(name: 'is_producer')
  final bool? isProducer;
  
  @ColumnInfo(name: 'is_operator')
  final bool? isOperator;
  
  @ColumnInfo(name: 'is_authority')
  final bool? isAuthority;
  
  @ColumnInfo(name: 'attribution_url')
  final URL? attributionUrl;
  
  @ColumnInfo(name: 'attribution_email')
  final Email? attributionEmail;
  
  @ColumnInfo(name: 'attribution_phone')
  final PhoneNumber? attributionPhone;
  
  const AttributionEntity(
    this.attributionId,
    this.agencyId,
    this.routeId,
    this.tripId,
    this.organizationName,
    this.isProducer,
    this.isOperator,
    this.isAuthority,
    this.attributionUrl,
    this.attributionEmail,
    this.attributionPhone,
  );
  
  factory AttributionEntity.fromJson(Map<String, dynamic> json) {
    return AttributionEntity(
      ID(json['attribution_id']),
      json['agency_id'] != null ? ID(json['agency_id']) : null,
      json['route_id'] != null ? ID(json['route_id']) : null,
      json['trip_id'] != null ? ID(json['trip_id']) : null,
      json['organization_name'],
      json['is_producer'],
      json['is_operator'],
      json['is_authority'],
      json['attribution_url'] != null ? URL(json['attribution_url']) : null,
      json['attribution_email'] != null ? Email(json['attribution_email']) : null,
      json['attribution_phone'] != null ? PhoneNumber(json['attribution_phone']) : null,
    );
  }
  
  @override
  List<Object?> get props => [
    attributionId,
    agencyId,
    routeId,
    tripId,
    organizationName,
    isProducer,
    isOperator,
    isAuthority,
    attributionUrl,
    attributionEmail,
    attributionPhone,
  ];
}
