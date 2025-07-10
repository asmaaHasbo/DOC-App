import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.isTextObsecure,
    this.suffixIcon,
    required this.controller,
    required this.validator,
  });

  final TextEditingController controller;
  final Widget? suffixIcon;
  final String hintText;
  final bool? isTextObsecure;
  // final VoidCallback validator;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isTextObsecure ?? false,
      decoration: InputDecoration(
        isDense: true, // يقلل الارتفاع والمساحات الداخلية
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 18.0.h),
        fillColor: AppColors.grayFD,
        filled: true,
        hintText: hintText,
        hintStyle: AppStyles.font14W500Grayc2,
        suffixIcon: suffixIcon,

        //------------------------------ borders -------------------------
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.w),
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.0.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.w),
          borderSide: BorderSide(color: Colors.blue, width: 1.0.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.w),
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.0.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.w),
          borderSide: BorderSide(color: Colors.red, width: 1.0.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0.w),
          borderSide: BorderSide(color: Colors.red, width: 1.0.w),
        ),
      ),
    );
  }
}
