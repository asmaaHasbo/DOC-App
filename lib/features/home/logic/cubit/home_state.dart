part of 'home_cubit.dart';

sealed class HomeSpecialityState {}

final class HomeSpecialityInitial extends HomeSpecialityState {}

final class HomeSpecialityLoading extends HomeSpecialityState {}

final class HomeSpecialitySuccess extends HomeSpecialityState {
  final HomeSpecializationResponseModel homeSpecializationResponseModel;
  HomeSpecialitySuccess({required this.homeSpecializationResponseModel});
}

final class HomeSpecialityFailure extends HomeSpecialityState {
  final String errorMessage;
  HomeSpecialityFailure({required this.errorMessage});
}
