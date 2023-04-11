import 'package:freezed_annotation/freezed_annotation.dart';

import '../geofence/geofence.dart';
import '../location/location.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  factory Project({
    required int id,
    int? companyId,
    required String name,
    String? code,
    String? description,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
    Geofence? geofence,
    Location? location,
    Geofence? locationGeofence,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
