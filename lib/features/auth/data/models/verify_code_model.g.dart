// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeModel _$VerifyCodeModelFromJson(Map<String, dynamic> json) =>
    VerifyCodeModel(
      phone: json['phone_number'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$VerifyCodeModelToJson(VerifyCodeModel instance) =>
    <String, dynamic>{
      'phone_number': instance.phone,
      'code': instance.code,
    };
