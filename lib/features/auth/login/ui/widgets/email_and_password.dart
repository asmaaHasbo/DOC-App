import 'package:doc_app/core/helper/email_password_regex.dart';
import 'package:doc_app/core/shared_widgets/custom_text_field.dart';
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  // الـ TextEditingController هو كائن بيُستخدم للتحكم في الحقول النصية (زي TextFormField أو TextField)، وبيحتاج يُنشأ مرة واحدة ويُحتفظ بيه طوال دورة حياة الويدجت. لو أنشأته في initState، بيتم إنشاؤه مرة واحدة بس ويتم الاحتفاظ بيه.

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
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordValidationListeners();
  }

  //------------- password controller بعمل ليسن علي ال
  void setupPasswordValidationListeners() {
    // هنا بنستخدم ال passwordController اللي تم تمريره من LoginCubit
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
    LoginCubit loginCubit = context.read<LoginCubit>();

    return Form(
      key: loginCubit.formKey,
      child: Column(
        children: [
          //--------------------------email ----------------------
          CustomTextField(
            controller: loginCubit.emailController,
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

          //--------------------------- password -------------------
          CustomTextField(
            controller: loginCubit.passwordController,
            hintText: 'password',
            isTextObsecure: isObscure,
            suffixIcon: IconButton(
              icon: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
                color: isObscure ? AppColors.gray : AppColors.primary,
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

          //--------------------- check validations on password -------------
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
      ),
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
