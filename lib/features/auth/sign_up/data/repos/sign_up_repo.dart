import 'package:doc_app/core/networking/api_result.dart';
import 'package:doc_app/core/networking/api_service.dart';
import 'package:doc_app/features/auth/sign_up/data/models/sign_up_request_model.dart';
import 'package:doc_app/features/auth/sign_up/data/models/sign_up_response_model.dart';

class SignUpRepo {
  ApiService apiService;
  SignUpRepo( this.apiService);

  Future<ApiResult<SignUpResponseModel>> signUp(SignUpRequestModel signUpRequestModel) async {
    try {
      final response = await apiService.singUp(signUpRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
