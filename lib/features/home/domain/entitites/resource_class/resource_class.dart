// ignore_for_file: invalid_annotation_target

import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_class.freezed.dart';
part 'resource_class.g.dart';

@freezed
class ResourceClass with _$ResourceClass {
  factory ResourceClass({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _ResourceClass;

  factory ResourceClass.fromJson(Map<String, dynamic> json) =>
      _$ResourceClassFromJson(json);
}
