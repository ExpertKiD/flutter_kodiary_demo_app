// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../geofence/geofence.dart';
import '../location/location.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  factory Project({
    required int id,
    @JsonKey(name: 'company_id') int? companyId,
    required String name,
    String? code,
    String? description,
    required String status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    Geofence? geofence,
    Location? location,
    @JsonKey(name: 'location_geofence') Geofence? locationGeofence,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
