import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:doc_app/features/home/data/models/home_specialization_response_model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListItem extends StatelessWidget {
  final DoctorModel doctorModelList;
  final int itemIndex;
  const DoctorListItem({
    super.key,
    required this.doctorModelList,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.directional(top: itemIndex == 0 ? 0.h : 16.h),
      child: Row(
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(12.r),

          //   child: Image.network(
          //     'https://static.vecteezy.com/system/resources/thumbnails/022/483/599/small_2x/elegant-3d-doctor-with-medical-bag-perfect-for-emergency-medical-services-ems-or-ambulance-advertising-transparent-background-free-png.png',

          //     height: 100.h,
          //     width: 100.w,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Image.asset("assets/images/doc_list.png", fit: BoxFit.cover),
          SizedBox(width: 10.w),
          SizedBox(
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModelList.name ?? 'Doctor Name',
                  style: AppStyles.font16W700Black21.copyWith(
                    color: AppColors.black21,
                  ),

                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10.h),
                Text(
                  '${doctorModelList.degree} | ${doctorModelList.phone}',
                  style: AppStyles.font12W500Gray75,
                ),

                SizedBox(height: 10.h),
                Text(
                  doctorModelList.email ?? 'email',
                  style: AppStyles.font12W500Gray75,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
