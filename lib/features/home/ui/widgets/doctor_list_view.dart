import 'package:doc_app/features/home/ui/widgets/doctor_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListView extends StatelessWidget {
  const DoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(top: index == 0 ? 0.0 : 16.h),
            child: DoctorListItem(),
          );
        },
      ),
    );
  }
}
