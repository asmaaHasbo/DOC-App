import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String? message;
  @JsonKey(name: 'data' )
  final DataModel? dataModel;
  final bool status;
  final int code;

  LoginResponseModel({required this.message, required this.dataModel, required this.status, required this.code});


  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);


}

@JsonSerializable()
class DataModel {
  final String token;
  @JsonKey(name: 'username')
  final String userName;

  DataModel({required this.token, required this.userName});

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}
