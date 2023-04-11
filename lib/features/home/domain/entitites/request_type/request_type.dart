// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_type.freezed.dart';
part 'request_type.g.dart';

@freezed
class RequestType with _$RequestType {
  factory RequestType({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'total_required') required int totalRequired,
    @JsonKey(name: 'total_committed') required int totalCommitted,
    @JsonKey(name: 'total_fulfilled') required int totalFulfilled,
  }) = _RequestType;

  factory RequestType.fromJson(Map<String, dynamic> json) =>
      _$RequestTypeFromJson(json);
}
