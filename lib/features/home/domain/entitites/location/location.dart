// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../coords/coords.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  factory Location({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'country') required String country,
    @JsonKey(name: 'city') required String city,
    @JsonKey(name: 'state') required String state,
    @JsonKey(name: 'postalCode') required String postalCode,
    @JsonKey(name: 'coords') required Coords location,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
