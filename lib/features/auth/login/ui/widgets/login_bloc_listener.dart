// ignore_for_file: avoid_print
import 'package:doc_app/core/helper/extensions.dart';
import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:doc_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      //------------ يعني ابدا تليسين و اشتغمل لما ال state تكون loading or success --------
      
      listener: (context, state) {
        print('Listener received state: $state');
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    content: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                        // strokeWidth: 2.0.sp,
                      ),
                    ),
                  ),
            );
          },

          success: (data) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
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
