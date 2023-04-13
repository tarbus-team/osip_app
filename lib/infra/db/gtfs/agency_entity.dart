import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/shared/vo/email.dart';
import 'package:osip_app/shared/vo/id.dart';
import 'package:osip_app/shared/vo/language_code.dart';
import 'package:osip_app/shared/vo/phone_number.dart';
import 'package:osip_app/shared/vo/timezone.dart';
import 'package:osip_app/shared/vo/url.dart';

@Entity(
  tableName: 'agency',
)
class AgencyEntity extends Equatable {
  @PrimaryKey()
  @ColumnInfo(name: 'agency_id')
  final ID? agencyId;

  @ColumnInfo(name: 'agency_name')
  final String agencyName;

  @ColumnInfo(name: 'agency_url')
  final URL agencyUrl;

  @ColumnInfo(name: 'agency_timezone')
  final Timezone agencyTimezone;

  @ColumnInfo(name: 'agency_lang')
  final LanguageCode? agencyLang;

  @ColumnInfo(name: 'agency_phone')
  final PhoneNumber? agencyPhone;

  @ColumnInfo(name: 'agency_fare_url')
  final URL? agencyFareUrl;

  @ColumnInfo(name: 'agency_email')
  final Email? agencyEmail;

  const AgencyEntity(
    this.agencyId,
    this.agencyName,
    this.agencyUrl,
    this.agencyTimezone,
    this.agencyLang,
    this.agencyPhone,
    this.agencyFareUrl,
    this.agencyEmail,
  );

  factory AgencyEntity.fromJson(Map<String, dynamic> json) {
    return AgencyEntity(
      json['agency_id'] != null ? ID(json['agency_id'].toString()) : null,
      json['agency_name'],
      URL(json['agency_url']),
      Timezone(json['agency_timezone']),
      json['agency_lang'] != null ? LanguageCode(json['agency_lang']) : null,
      json['agency_phone'] != null ? PhoneNumber(json['agency_phone']) : null,
      json['agency_fare_url'] != null ? URL(json['agency_fare_url']) : null,
      json['agency_email'] != null ? Email(json['agency_email']) : null,
    );
  }

  @override
  List<Object?> get props => [agencyId, agencyName, agencyUrl, agencyTimezone, agencyLang, agencyPhone, agencyFareUrl, agencyEmail];
}
