import 'package:dio/dio.dart';
import 'package:doc_app/core/networking/api_end_pontis.dart';
import 'package:doc_app/features/home/data/models/home_specialization_response_model/home_specialization_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiEndPontis.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  //------------- get home data api ------------------

  @GET(ApiEndPontis.specialization)
  Future<HomeSpecializationResponseModel> getHomeSpecialization();
}
