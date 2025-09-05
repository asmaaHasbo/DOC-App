import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindDoctorContainer extends StatelessWidget {
  const FindDoctorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 167.h,
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: const DecorationImage(
                image: AssetImage("assets/images/home_background.png"),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: AppStyles.font18W500White,
                ),
                SizedBox(height: 5.h),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.w,
                        vertical: 10.h,
                      ),
                    ),
                    child: Text(
                      'Find Nearby',
                      style: AppStyles.font12W400Gray9E.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16.w,
            bottom: 0,
            child: Image.asset(
              "assets/images/Image.png",
              width: 138.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
