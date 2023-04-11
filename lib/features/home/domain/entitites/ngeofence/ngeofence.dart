// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ngeofence.freezed.dart';
part 'ngeofence.g.dart';

@freezed
class NGeofence with _$NGeofence {
  factory NGeofence() = _NGeofence;

  factory NGeofence.fromJson(Map<String, dynamic> json) =>
      _$NGeofenceFromJson(json);
}
