// ignore_for_file: avoid_print

import 'package:doc_app/core/shared_widgets/custom_text_field.dart';
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  style: AppStyles.font14W400Gray,
                ),
                SizedBox(height: 40.h),
                CustomTextField(labelText: 'Email'),
                SizedBox(height: 16.h),
                CustomTextField(labelText: 'Password'),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              // isChecked = !isChecked;
                              isChecked = value ?? false;
                            });
                          },
                          activeColor: Colors.green,
          
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0.w),
                          ),
                          side: BorderSide(color: Color(0xFFA9B2B9), width: 2.w),
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
                ElevatedButton(
                  onPressed: () {
                    // Handle login action
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
                    style: AppStyles.font16W600Blue.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(height: 24.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:  'By logging, you agree to our',
                      style: AppStyles.font12W400Gray9E.copyWith(fontSize: 12.sp)
                      ),
                      TextSpan(
                        text: ' Terms & Conditions ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      ),
                  TextSpan(
                        text:  ' and ',
                      style: AppStyles.font12W400Gray9E.copyWith(fontSize: 12.sp),
                      ),TextSpan(
                        text:  'Privacy Policy.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),)
                    ]
                  )
                  
                  ),
             
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: AppStyles.font12W400Gray9E.copyWith(fontSize: 12.sp),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
