// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../location/location.dart';
import '../ngeofence/ngeofence.dart';

part 'trip_detail.freezed.dart';
part 'trip_detail.g.dart';

@freezed
class TripDetail with _$TripDetail {
  factory TripDetail({
    @JsonKey(name: 'origin') required Location origin,
    @JsonKey(name: 'destination') required Location destination,
    @JsonKey(name: 'origin_geofence') required NGeofence originGeofence,
    @JsonKey(name: 'destination_geofence')
        required NGeofence destinationGeofence,
  }) = _TripDetail;

  factory TripDetail.fromJson(Map<String, dynamic> json) =>
      _$TripDetailFromJson(json);
}
