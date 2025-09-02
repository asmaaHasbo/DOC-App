import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  final String? message;
  @JsonKey(name: 'data')
  final DataModel? dataModel;
  final bool status;
  final int code;

  SignUpResponseModel({
    required this.message,
    required this.dataModel,
    required this.status,
    required this.code,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);
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
