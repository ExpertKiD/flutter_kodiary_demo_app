import 'package:freezed_annotation/freezed_annotation.dart';

import '../coords/coords.dart';

part 'geofence.freezed.dart';
part 'geofence.g.dart';

@freezed
class Geofence with _$Geofence {
  factory Geofence({
    String? type,
    List<Coords>? data,
    Coords? center,
  }) = _Geofence;

  factory Geofence.fromJson(Map<String, dynamic> json) =>
      _$GeofenceFromJson(json);
}
