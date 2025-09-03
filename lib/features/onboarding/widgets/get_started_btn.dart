import 'package:doc_app/core/helper/extensions.dart';
import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class GetStartedBtn extends StatelessWidget {
  const GetStartedBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
    );
  }
}
