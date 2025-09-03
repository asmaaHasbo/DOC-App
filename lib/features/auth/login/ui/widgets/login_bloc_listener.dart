// ignore_for_file: avoid_print
import 'package:doc_app/core/helper/extensions.dart';
import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_widgets/setup_showing_dialog_for_error_state.dart';

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
                  (context) => Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                      // strokeWidth: 2.0.sp,
                    ),
                  ),
            );
          },

          success: (data) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },

          error: (errMsg) {
            context.pop();
            // Show error message
            setupShowingDialogForErrorState(context, errMsg: errMsg);
          },
        );
      },

      // This widget does nothing, just to satisfy the BlocListener
      child: SizedBox.shrink(),
    );
  }
}
