import 'package:doc_app/core/helper/extensions.dart';
import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:doc_app/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doc_app/features/auth/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        debugPrint('Listener received state: $state');

        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
            );
          },
          success: (data) {
            context.pop(); // Close the loading dialog
            context.pushNamed(Routes.homeScreen); // Navigate to home screen
            // Close the loading dialog
            // Navigate to the next screen or perform any other action
          },

          error: (error) {
            context.pop();
            // Show error message
            setupErrorState(context, error);
          },
        );
      },

      // This widget does nothing, just to satisfy the BlocListener
      child: SizedBox.shrink(),
    );
  }

  setupErrorState(BuildContext context, String error) {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: Icon(Icons.error, color: Colors.red, size: 32.sp),
            content: Text(
              error,
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
}
