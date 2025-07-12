import 'package:flutter/material.dart';

import 'package:doc_app/core/themes/colors/app_colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasNumber;
  final bool hasSpecialChar;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasNumber,
    required this.hasSpecialChar,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPasswordValidationUI(
          text: 'At least 1 lowercase letter',
          isValidted: hasLowerCase,
        ),
        SizedBox(height: 5.h),

        buildPasswordValidationUI(
          text: 'At least 1 uppercase letter',
          isValidted: hasUpperCase,
        ),
        SizedBox(height: 5.h),

        buildPasswordValidationUI(
          text: 'At least 1 numper ',
          isValidted: hasNumber,
        ),
        SizedBox(height: 5.h),

        buildPasswordValidationUI(
          text: 'At least 1 special character',
          isValidted: hasSpecialChar,
        ),
        SizedBox(height: 5.h),

        buildPasswordValidationUI(
          text: 'At least 8 characters',
          isValidted: hasMinLength,
        ),
      ],
    );
  }

  Row buildPasswordValidationUI({text, required bool isValidted}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 3.w,
          backgroundColor: isValidted ? Colors.green : AppColors.gray,
        ),
        SizedBox(width: 5.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 13.sp,
            color: isValidted ? Colors.green : AppColors.gray,
            decoration: isValidted ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2.w,
          ),
        ),
      ],
    );
  }
}
