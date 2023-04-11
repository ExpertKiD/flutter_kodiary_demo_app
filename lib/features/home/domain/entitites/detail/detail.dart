// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../date_range/date_range.dart';
import '../project/project.dart';
import '../resource_class/resource_class.dart';
import '../trip_detail/trip_detail.dart';

part 'detail.freezed.dart';
part 'detail.g.dart';

@freezed
class Detail with _$Detail {
  factory Detail({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'request_type_id') required int requestTypeId,
    @JsonKey(name: 'company_request_id') required int companyRequestId,
    @JsonKey(name: 'generic_class_id') required int genericClassId,
    @JsonKey(name: 'vendor_engaged') required List<dynamic> vendorEngaged,
    @JsonKey(name: 'resource_class') required ResourceClass resourceClass,
    @JsonKey(name: 'operation_type') required String operationType,
    @JsonKey(name: 'quantity') required String quantity,
    @JsonKey(name: 'fulfilled_quantity') required String fulfilledQuantity,
    @JsonKey(name: 'remaining_quantity') required String remainingQuantity,
    @JsonKey(name: 'vendors_committed_quantity')
        required String vendorsCommittedQuantity,
    @JsonKey(name: 'vendors_supplied_quantity')
        required String vendorsSuppliedQuantity,
    @JsonKey(name: 'trip_detail') required TripDetail tripDetail,
    @JsonKey(name: 'source_zone_id') required int sourceZoneId,
    @JsonKey(name: 'source') required Project source,
    @JsonKey(name: 'destination') required Project destination,
    @JsonKey(name: 'destination_zone_id') required int destinationZoneId,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'date_range') required DateRange dateRange,
  }) = _Detail;

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}
