import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../goshow/domain/entities/direct_spv.dart';

part 'search_emp_model.freezed.dart';
part 'search_emp_model.g.dart';

@freezed
abstract class SearchEmpModel with _$SearchEmpModel {
  const factory SearchEmpModel({
    int? status,
    List<DirectSpv>? data,
    String? message,
  }) = _SearchEmpModel;

  factory SearchEmpModel.fromJson(Map<String, dynamic> json) => _$SearchEmpModelFromJson(json);
}
