import 'package:doc_app/core/helper/extensions.dart';
import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(20.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //-------------- Logo and Title --------------//
            Padding(
              padding: EdgeInsets.only(top: 20.0.h, bottom: 20.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/logo.svg',
                    height: 38.h,
                    width: 38.w,
                  ),
                  SizedBox(width: 5.w),
                  Text('Docdoc', style: AppStyles.font24W600Black),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            //-------------- Onboarding Image --------------//
            Stack(
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
                      colors: [
                        Colors.white,
                        Colors.white.withValues(alpha: 0.0),
                      ],
                      stops: [0.14, 0.4],
                    ),
                  ),
                  child: Image.asset('assets/images/doc_img.png'),
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
            ),

            Text(
              'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
              style: AppStyles.font14W400Gray75,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),

            //-------------- Get satarted Button --------------//
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen
                context.pushNamed(
                  Routes.loginScreen,
                ); // Adjust the route as needed
              },

              style: ElevatedButton.styleFrom(
                minimumSize: Size(311.w, 52.h),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text('Get Started', style: AppStyles.font16W600Blue),
            ),
          ],
        ),
      ),
    );
  }
}
