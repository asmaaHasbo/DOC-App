// ignore_for_file: avoid_print
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:doc_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/features/auth/login/ui/widgets/dont_have_account.dart';
import 'package:doc_app/features/auth/login/ui/widgets/email_and_password.dart';
import 'package:doc_app/features/auth/login/ui/widgets/login_bloc_listener.dart';
import 'package:doc_app/features/auth/login/ui/widgets/trems_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  final bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text('Welcome Back', style: AppStyles.font24W700blue),
                SizedBox(height: 20.h),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: AppStyles.font14W400Gray75,
                ),
                SizedBox(height: 40.h),
            
                EmailAndPassword(),
                SizedBox(height: 16.h),
            
                //------------------------------- forget password ----------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {},
                          activeColor: Colors.green,
            
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0.w),
                          ),
                          side: BorderSide(
                            color: Color(0xFFA9B2B9),
                            width: 2.w,
                          ),
                        ),
                        // SizedBox(width: 2.w),
                        Text('Remember Me', style: AppStyles.font14W500Grayc2),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle forgot password action
                      },
                      child: Text(
                        'Forgot Password?',
                        style: AppStyles.font12W400Gray9E.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
            
                //----------------------------------- LOGIN BTN ----------------------
                ElevatedButton(
                  onPressed: () {
                    if (context
                        .read<LoginCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      // If the form is valid, proceed with login
                      context.read<LoginCubit>().emitLoginStates();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    fixedSize: Size(327.w, 52.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0.w),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: AppStyles.font16W600Blue.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
            
                //--------------------------------- Terms and Conditions ----------------------
                TermsConditions(),
            
                SizedBox(height: 24.h),
                DontHaveAccount(),
            
                //-----------------------------------
                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
