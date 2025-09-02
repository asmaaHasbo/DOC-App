import 'package:dio/dio.dart';
import 'package:doc_app/core/networking/api_end_pontis.dart';
import 'package:doc_app/features/auth/login/data/models/login_request_model.dart';
import 'package:doc_app/features/auth/login/data/models/login_response_model.dart';
import 'package:doc_app/features/auth/sign_up/data/models/sign_up_request_model.dart';
import 'package:doc_app/features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndPontis.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //------------- login api ------------------
  @POST(ApiEndPontis.login)
  Future<LoginResponseModel> login(@Body() LoginRequestModel loginRequestModel);

  //---------------- sign up api ------------
  @POST(ApiEndPontis.signUp)
  Future<SignUpResponseModel> singUp(
    @Body() SignUpRequestModel signUpRequestModel,
  );
}
