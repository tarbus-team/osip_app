import 'package:osip_app/infra/dto/available_timetable_version_dto.dart';

class TimetableConfigRepository {
  Map<String, dynamic> getLatestTimetableVersions(List<String> subscribeCodes) {
    return <String, dynamic>{};
  }
  
  List<AvailableTimetableVersionDto> getAllAvailableTimetableVersions() {
    return <AvailableTimetableVersionDto>[];
  }
}