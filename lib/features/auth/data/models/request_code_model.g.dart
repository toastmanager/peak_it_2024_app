// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestCodeModel _$RequestCodeModelFromJson(Map<String, dynamic> json) =>
    RequestCodeModel(
      phone: json['phone_number'] as String,
    );

Map<String, dynamic> _$RequestCodeModelToJson(RequestCodeModel instance) =>
    <String, dynamic>{
      'phone_number': instance.phone,
    };
