import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:doc_app/features/onboarding/widgets/get_started_btn.dart';
import 'package:doc_app/features/onboarding/widgets/logo_and_title.dart';
import 'package:doc_app/features/onboarding/widgets/stack_onboarding_doc_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            LogoAndTitle(),
            SizedBox(height: 20.h),

            StackOnboardingDocImg(),

            Text(
              'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
              style: AppStyles.font14W400Gray75,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 30.h),

            GetStartedBtn(),
          ],
        ),
      ),
    );
  }
}
