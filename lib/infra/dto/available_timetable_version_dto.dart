import 'package:equatable/equatable.dart';

class AvailableTimetableVersionDto extends Equatable {
  final String subscribeCode;
  final String name;
  final int updateTimestamp;

  const AvailableTimetableVersionDto({
    required this.subscribeCode,
    required this.name,
    required this.updateTimestamp,
  });

  @override
  List<Object> get props => [subscribeCode, name, updateTimestamp];
}
