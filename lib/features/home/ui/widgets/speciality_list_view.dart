import 'package:doc_app/features/home/data/models/home_specialization_response_model/specialization_mata_model.dart';
import 'package:doc_app/features/home/ui/widgets/speciality_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityList extends StatelessWidget {
  final List<SpecializationDataModel> specializationList;
  const SpecialityList({super.key, required this.specializationList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: specializationList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SpecialityListItem(specializationList: specializationList , itemIndex: index);
        },
      ),
    );
  }
}
