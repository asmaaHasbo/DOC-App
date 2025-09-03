import 'package:doc_app/features/home/data/models/home_specialization_response_model/doctor_model.dart';
import 'package:doc_app/features/home/ui/widgets/doctor_list_item.dart';
import 'package:flutter/material.dart';

class DoctorListView extends StatelessWidget {
  final List<DoctorModel> doctorModelList;
  const DoctorListView({super.key, required this.doctorModelList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return DoctorListItem(
            doctorModelList: doctorModelList[index],
            itemIndex: index,
          );
        },
      ),
    );
  }
}
