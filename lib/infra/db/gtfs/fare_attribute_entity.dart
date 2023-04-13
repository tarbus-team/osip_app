import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:osip_app/infra/db/gtfs/agency_entity.dart';
import 'package:osip_app/infra/db/gtfs/enum/payment_method.dart';
import 'package:osip_app/infra/db/gtfs/enum/transfers.dart';
import 'package:osip_app/shared/vo/currency_code.dart';
import 'package:osip_app/shared/vo/id.dart';

@Entity(
  tableName: 'fare_attributes',
  foreignKeys: [
    ForeignKey(
      childColumns: ['agency_id'],
      parentColumns: ['agency_id'],
      entity: AgencyEntity,
    ),
  ],
)
class FareAttributeEntity extends Equatable {
  @PrimaryKey()
  @ColumnInfo(name: 'fare_id')
  final ID fareId;

  @ColumnInfo(name: 'price')
  final double price;

  @ColumnInfo(name: 'currency_type')
  final CurrencyCode currencyType;

  @ColumnInfo(name: 'payment_method')
  final PaymentMethod paymentMethod;

  @ColumnInfo(name: 'transfers')
  final Transfers transfers;

  @ColumnInfo(name: 'agency_id')
  final ID? agencyId;

  @ColumnInfo(name: 'transfer_duration')
  final int? transferDuration;

  const FareAttributeEntity(
    this.fareId,
    this.price,
    this.currencyType,
    this.paymentMethod,
    this.transfers,
    this.agencyId,
    this.transferDuration,
  );
  
  factory FareAttributeEntity.fromJson(Map<String, dynamic> json) {
    return FareAttributeEntity(
      ID(json['fare_id']),
      json['price'],
      CurrencyCode(json['currency_type']),
      PaymentMethod.values[json['payment_method']],
      Transfers.values[json['transfers']],
      json['agency_id'] != null ? ID(json['agency_id']) : null,
      json['transfer_duration'],
    );
  }
  
  @override
  List<Object?> get props => [
    fareId,
    price,
    currencyType,
    paymentMethod,
    transfers,
    agencyId,
    transferDuration,
  ];
}
