import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/shared/vo/date.dart';
import 'package:osip_app/shared/vo/email.dart';
import 'package:osip_app/shared/vo/language_code.dart';
import 'package:osip_app/shared/vo/url.dart';
import 'package:uuid/uuid.dart';

@Entity(
  tableName: 'feed_info',
)
class FeedInfoEntity extends Equatable {
  @PrimaryKey()
  final String? id;

  @ColumnInfo(name: 'feed_publisher_name')
  final String feedPublisherName;

  @ColumnInfo(name: 'feed_publisher_url')
  final URL feedPublisherUrl;

  @ColumnInfo(name: 'feed_lang')
  final LanguageCode feedLang;

  @ColumnInfo(name: 'default_lang')
  final LanguageCode? defaultLang;

  @ColumnInfo(name: 'feed_start_date')
  final Date? feedStartDate;

  @ColumnInfo(name: 'feed_end_date')
  final Date? feedEndDate;

  @ColumnInfo(name: 'feed_version')
  final String? feedVersion;

  @ColumnInfo(name: 'feed_contact_email')
  final Email? feedContactEmail;

  @ColumnInfo(name: 'feed_contact_url')
  final URL? feedContactUrl;

  const FeedInfoEntity(
    this.id,
    this.feedPublisherName,
    this.feedPublisherUrl,
    this.feedLang,
    this.defaultLang,
    this.feedStartDate,
    this.feedEndDate,
    this.feedVersion,
    this.feedContactEmail,
    this.feedContactUrl,
  );
  
  factory FeedInfoEntity.fromJson(Map<String, dynamic> json) {
    return FeedInfoEntity(
      json['id'] ?? const Uuid().v4(),
      json['feed_publisher_name'],
      URL(json['feed_publisher_url']),
      LanguageCode(json['feed_lang']),
      json['default_lang'] != null ? LanguageCode(json['default_lang']) : null,
      json['feed_start_date'] != null ? Date(json['feed_start_date']) : null,
      json['feed_end_date'] != null ? Date(json['feed_end_date']) : null,
      json['feed_version'],
      json['feed_contact_email'] != null ? Email(json['feed_contact_email']) : null,
      json['feed_contact_url'] != null ? URL(json['feed_contact_url']) : null,
    );
  }

  @override
  List<Object?> get props => [
        feedPublisherName,
        feedPublisherUrl,
        feedLang,
        defaultLang,
        feedStartDate,
        feedEndDate,
        feedVersion,
        feedContactEmail,
        feedContactUrl,
      ];
}
