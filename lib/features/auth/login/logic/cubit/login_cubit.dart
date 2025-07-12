// ignore_for_file: avoid_print

import 'package:doc_app/features/auth/login/data/models/login_request_model.dart';
import 'package:doc_app/features/auth/login/data/repos/login_repo.dart';
import 'package:doc_app/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Emits the login states based on the response from the login repository.
  Future<void> emitLoginStates() async {
    print('loading');

    emit(LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestModel(email: emailController.text, 
      password: passwordController.text),
    );

    response.when(
      success: (loginResponseModel) {
        print('login cupit success');

        emit(LoginState.success(loginResponseModel));
      },
      failure: (error) {
        print('error');

        emit(LoginState.error(error: error));
      },
    );
  }
}
