import 'package:doc_app/core/shared_widgets/custom_text_field.dart';
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/features/auth/login/ui/widgets/password_validations.dart';
import 'package:doc_app/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:doc_app/core/helper/app_regex.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController passwordController;

  bool isObscure = true;

  bool hasLowerCase = false;

  bool hasUpperCase = false;

  bool hasNumber = false;

  bool hasSpecialChar = false;

  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignUpCubit>().passwordController;
    setupPasswordValidationListeners();
  }

  //------------- password controller بعمل ليسن علي ال
  void setupPasswordValidationListeners() {
    // هنا بنستخدم ال passwordController اللي تم تمريره من SignUpCubit
    // و بنضيف ليسنر عليه علشان نتحقق من صحة كلمة المرور
    // و بنستخدم AppRegex للتحقق من صحة كلمة المرور
    // بنستخدم setState علشان نحدث الواجهة بناءً على القيم الجديدة

    passwordController.addListener(() {
      final password = passwordController.text;

      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(password);
        hasUpperCase = AppRegex.hasUpperCase(password);
        hasNumber = AppRegex.hasNumber(password);
        hasSpecialChar = AppRegex.hasSpecialChar(password);
        hasMinLength = AppRegex.hasMinLength(password);
      });
    });
  }

  @override
  void dispose() {
    // هنا بنقوم بتفريغ ال passwordController عند انتهاء الويدجت
    // علشان نتجنب تسرب الذاكرة
    // و بنستخدم super.dispose() لاستدعاء الدالة الأساسية
    // اللي بتقوم بتفريغ الموارد المستخدمة في الويدجت

    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();

    return Form(
      key: signUpCubit.signUpFormKey,
      child: Column(
        children: [
          //-------------------------- name ----------------------
          CustomTextField(
            controller: signUpCubit.nameController,
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid Name';
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),

          //-------------------------- email ----------------------
          CustomTextField(
            controller: signUpCubit.emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),

          //-------------------------- phone ----------------------
          CustomTextField(
            controller: signUpCubit.phoneController,
            hintText: 'Phone',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter valid Phone Number';
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),

          //--------------------------- password -------------------
          CustomTextField(
            controller: signUpCubit.passwordController,
            hintText: 'password',
            isTextObsecure: isObscure,
            suffixIcon: IconButton(
              icon: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
                color: isObscure ? AppColors.gray75 : AppColors.primary,
              ),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid password';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          //--------------------------- password confirm -------------------
          CustomTextField(
            controller: signUpCubit.passwordConfirmationController,
            hintText: 'password confirm',
            isTextObsecure: isObscure,
            suffixIcon: IconButton(
              icon: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
                color: isObscure ? AppColors.gray75 : AppColors.primary,
              ),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value != signUpCubit.passwordController.text) {
                return 'Value must match password';
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),

          //--------------------- check validations on password -------------
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasNumber: hasNumber,
            hasSpecialChar: hasSpecialChar,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
