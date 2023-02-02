// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponseModel _$UserDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserDataResponseModel(
      response: (json['response'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : UserdDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataResponseModelToJson(
        UserDataResponseModel instance) =>
    <String, dynamic>{
      'response': instance.response,
    };
