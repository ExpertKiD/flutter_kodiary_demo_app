import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/enums.dart';
import '../coords/coords.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  factory Location({
    String? name,
    required String address,
    required Country country,
    required String city,
    required State state,
    required String postalCode,
    required Coords location,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
