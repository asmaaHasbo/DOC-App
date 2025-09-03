import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

setupShowingDialogForErrorState(
  BuildContext context, {
  required String errMsg,
}) {
  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          icon: Icon(Icons.error, color: Colors.red, size: 32.sp),
          content: Text(
            errMsg,
            style: AppStyles.font14W500Grayc2.copyWith(fontSize: 15.sp),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: AppStyles.font14W500Grayc2.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
  );
}
