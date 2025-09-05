import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/home_specialization_response_model/specialization_mata_model.dart';

class SpecialityListItem extends StatelessWidget {
  final List<SpecializationDataModel> specializationList;
  final int itemIndex;

  const SpecialityListItem({
    super.key,
    required this.specializationList,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0.0 : 16.w),

      child: SizedBox(
        height: 100.h,
        child: Column(
          children: [
            SizedBox(
              height: 56.h,
              width: 56.w,
              child: CircleAvatar(
                radius: 38.r,
                backgroundColor: AppColors.primarySurface,
                child: Image.asset('assets/images/brain.png'),
              ),
            ),
            Text(
              specializationList[itemIndex].name ?? 'specialization name',
              overflow: TextOverflow.ellipsis,
              style: AppStyles.font12W400Gray9E.copyWith(
                color: AppColors.black24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
