// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sing_up_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpModel _$SignUpModelFromJson(Map<String, dynamic> json) => SignUpModel(
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignUpModelToJson(SignUpModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
    };
