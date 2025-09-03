import 'city.dart';

class DoctorModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  City? city;
  int? appointPrice;
  String? startTime;
  String? endTime;

  DoctorModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    photo: json['photo'] as String?,
    gender: json['gender'] as String?,
    address: json['address'] as String?,
    description: json['description'] as String?,
    degree: json['degree'] as String?,

    city:
        json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
    appointPrice: json['appoint_price'] as int?,
    startTime: json['start_time'] as String?,
    endTime: json['end_time'] as String?,
  );
}
