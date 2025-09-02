import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Hi, Asmaa!', style: AppStyles.font18W600Black),
            Text('How Are you Today?', style: AppStyles.font11W400Gray61),
          ],
        ),

        const Spacer(),
        SizedBox(
          height: 48.h,
          width: 48.w,
          child: CircleAvatar(
            radius: 24.r,
            backgroundColor: AppColors.whiteF5,
            child: SvgPicture.asset("assets/svgs/notification.svg"),
          ),
        ),
      ],
    );
  }
}
