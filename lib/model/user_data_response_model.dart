import 'package:json_annotation/json_annotation.dart';
import 'package:new_project/model/user_data_modell.dart';

part 'user_data_response_model.g.dart';

@JsonSerializable()
class UserDataResponseModel {
  final List<UserdDataModel?>? response;

  UserDataResponseModel({this.response});

  factory UserDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataResponseModelToJson(this);
}
