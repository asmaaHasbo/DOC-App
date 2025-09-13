import 'package:doc_app/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doc_app/features/auth/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:doc_app/features/auth/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:doc_app/features/auth/login/ui/widgets/dont_have_account.dart';
import 'package:doc_app/features/auth/login/ui/widgets/trems_conditions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
            
                //----------- form -------------------------
                SignUpForm(),
                SizedBox(height: 16.h),
            
                //------------------------------- forget password ----------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: true,
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
            
                //----------------------------------- sign up BTN ----------------------
                ElevatedButton(
                  onPressed: () {
                    if (context
                        .read<SignUpCubit>()
                        .signUpFormKey
                        .currentState!
                        .validate()) {
                      context.read<SignUpCubit>().emitSignUpStates();
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
                    'Sign Up',
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
                SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
