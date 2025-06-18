import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String message;
  final List data;
  final String status;
  final int code;

  ApiErrorModel({
    required this.code ,
    required this.data ,
    required this.message,
    required this.status
  });

  factory ApiErrorModel.fromJson(json) => _$ApiErrorModelFromJson(json) ;

}
