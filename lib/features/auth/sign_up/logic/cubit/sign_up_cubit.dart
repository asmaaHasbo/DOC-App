import 'package:bloc/bloc.dart';
import 'package:doc_app/core/helper/shared_preferences.dart';
import 'package:doc_app/features/auth/sign_up/data/models/sign_up_request_model.dart';
import 'package:doc_app/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:doc_app/features/auth/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/helper/constant.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(SignUpState.initial());

  final SignUpRepo _signUpRepo;

  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  Future<void> emitSignUpStates() async {
    emit(SignUpState.loading());
    final response = await _signUpRepo.signUp(
      SignUpRequestModel(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        phone: phoneController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );

    response.when(
      success: (data) async {
        await saveUserToken(userToken: data.dataModel?.token ?? '');
        emit(SignUpState.success(data));
      },

      failure: (message) => emit(SignUpState.error(error: message)),
    );
  }

  Future<void> saveUserToken({required String userToken}) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, userToken);
  }
}
