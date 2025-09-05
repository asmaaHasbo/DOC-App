import 'package:doc_app/features/home/data/models/home_specialization_response_model/home_specialization_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doc_app/features/home/data/repos/home_repo.dart';


part 'home_state.dart';
//homespecialite

class HomeSpecialityCubit extends Cubit<HomeSpecialityState> {
  HomeRepo homeRepo;

  HomeSpecialityCubit(this.homeRepo) : super(HomeSpecialityInitial());

  getHomeSpecializationDoctors() async {
    emit(HomeSpecialityLoading());
    final result = await homeRepo.getHomeSpecialization();

    result.when(
      success: (data) {
        emit(HomeSpecialitySuccess(homeSpecializationResponseModel: data));
      },
      failure: (error) {
        emit(HomeSpecialityFailure(errorMessage: error));
      },
    );
  }

}
