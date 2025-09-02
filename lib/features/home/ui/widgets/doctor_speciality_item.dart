import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityItem extends StatelessWidget {
  const DoctorSpecialityItem({
    super.key,
    required this.itemTitle,
    required this.imgUrl,
  });

  final String itemTitle;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Column(
        children: [
          CircleAvatar(
            radius: 38.r,
            backgroundColor: AppColors.primarySurface,
            child: Image.asset(imgUrl),
          ),
          Text(
            itemTitle,
            style: AppStyles.font12W400Gray9E.copyWith(
              color: AppColors.black24,
            ),
          ),
        ],
      ),
    );
  }
}
