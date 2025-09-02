import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListItem extends StatelessWidget {
  const DoctorListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/doc_list.png", fit: BoxFit.cover),
        SizedBox(width: 10.w),
        Column(
          children: [
            Text('Dr. Randy Wigham', style: AppStyles.font12W500Gray75),
            SizedBox(height: 5.h),
            Text('Degree | 1029999', style: AppStyles.font12W500Gray75),
            SizedBox(height: 5.h),

            SizedBox(height: 5.h),
            Text('Email@gmail.com', style: AppStyles.font12W500Gray75),
          ],
        ),
      ],
    );
  }
}
