import 'datum.dart';

class HomeSpecializationResponseModel {
  String? message;
  List<Datum>? data;
  bool? status;
  int? code;

  HomeSpecializationResponseModel({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  factory HomeSpecializationResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeSpecializationResponseModel(
      message: json['message'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
              .toList(),
      status: json['status'] as bool?,
      code: json['code'] as int?,
    );
  }

  
}
