
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.labelText,
  });

  final String labelText ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: AppColors.borderColor,
        labelText: labelText,
        labelStyle: AppStyles.font14W500Grayc2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.w),
          borderSide: BorderSide(color: AppColors.gray9E, width: 1.0.w),
    
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.w),
          borderSide: BorderSide(color: Colors.blue, width: 1.0.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.w),
          borderSide: BorderSide(color: AppColors.gray9E, width: 1.0.w),
        ),
      ),
    );
  }
}