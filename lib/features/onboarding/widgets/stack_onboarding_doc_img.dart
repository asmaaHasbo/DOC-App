import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StackOnboardingDocImg extends StatelessWidget {
  const StackOnboardingDocImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/svgs/logo_with_low_obacity.svg',
          height: 443.h,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.white, Colors.white.withValues(alpha: 0.0)],
              stops: [0.14, 0.4],
            ),
          ),
          child: Image.asset('assets/images/doc_onboarding_img.png'),
        ),
        Positioned(
          bottom: 30.h,
          left: 0.w,
          right: 0.w,
          child: Text(
            'Best Doctor\nAppointment App',
            style: AppStyles.font32W700blue.copyWith(height: 1.5.sp),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
