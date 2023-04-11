import 'package:freezed_annotation/freezed_annotation.dart';

part 'coords.freezed.dart';
part 'coords.g.dart';

@freezed
class Coords with _$Coords {
  factory Coords({
    required double lat,
    required double lng,
  }) = _Coords;

  factory Coords.fromJson(Map<String, dynamic> json) => _$CoordsFromJson(json);
}
