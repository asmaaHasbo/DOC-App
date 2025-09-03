import 'package:doc_app/features/home/data/models/home_specialization_response_model/doctor_model.dart';

class SpecializationDataModel {
  int? id;
  String? name;
  List<DoctorModel>? doctors;

  SpecializationDataModel({this.id, this.name, this.doctors});

  factory SpecializationDataModel.fromJson(Map<String, dynamic> json) =>
      SpecializationDataModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        doctors:
            (json['doctors'] as List<dynamic>?)
                ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
                .toList(),
      );
}
