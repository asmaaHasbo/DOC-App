import 'doctor.dart';

class Datum {
  int? id;
  String? name;
  List<Doctor>? doctors;

  Datum({this.id, this.name, this.doctors});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    name: json['name'] as String?,
    doctors:
        (json['doctors'] as List<dynamic>?)
            ?.map((e) => Doctor.fromJson(e as Map<String, dynamic>))
            .toList(),
  );


}
