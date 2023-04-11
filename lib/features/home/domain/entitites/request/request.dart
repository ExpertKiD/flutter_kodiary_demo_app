// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../detail/detail.dart';
import '../request_type/request_type.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@freezed
class Request with _$Request {
  factory Request({
    @JsonKey(name: 'request_type_id') required int requestTypeId,
    @JsonKey(name: 'request_type') required RequestType requestType,
    @JsonKey(name: 'details') required List<Detail> details,
    @JsonKey(name: 'total_required_quantity')
        required int totalRequiredQuantity,
    @JsonKey(name: 'total_fulfilled_quantity')
        required int totalFulfilledQuantity,
    @JsonKey(name: 'total_committed_quantity')
        required int totalCommittedQuantity,
  }) = _Request;

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);
}
