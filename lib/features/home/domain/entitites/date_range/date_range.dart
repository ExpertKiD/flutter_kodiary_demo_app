// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_range.freezed.dart';
part 'date_range.g.dart';

@freezed
class DateRange with _$DateRange {
  factory DateRange({
    required String start,
    required String end,
  }) = _DateRange;

  factory DateRange.fromJson(Map<String, dynamic> json) =>
      _$DateRangeFromJson(json);
}
