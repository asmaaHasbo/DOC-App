import 'package:doc_app/core/networking/api_result.dart';
import 'package:doc_app/features/home/data/api/home_api_service.dart';
import 'package:doc_app/features/home/data/models/home_specialization_response_model/home_specialization_response_model.dart';

class HomeRepo {
  final  HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<HomeSpecializationResponseModel>> getHomeSpecialization() async{
    try{
      final response = await _homeApiService.getHomeSpecialization();
      return ApiResult.success(response);
    }
    catch(e){
      return ApiResult.failure(e.toString());
    }
  }
}
