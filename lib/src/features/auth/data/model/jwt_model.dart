import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/jwt_domain.dart';

part 'jwt_model.freezed.dart';
part 'jwt_model.g.dart';

@freezed
abstract class JwtModel with _$JwtModel {
  const factory JwtModel({
    int? status,
    JwtDomain? data,
    String? message,
  }) = _JwtModel;

  factory JwtModel.fromJson(Map<String, dynamic> json) => _$JwtModelFromJson(json);
}
