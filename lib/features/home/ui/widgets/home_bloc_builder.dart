import 'package:doc_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doc_app/features/home/ui/widgets/doctor_list_view.dart';
import 'package:doc_app/features/home/ui/widgets/speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared_widgets/setup_showing_dialog_for_error_state.dart';

class HomeBlocBuilder extends StatelessWidget {
  const HomeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeSpecialityCubit, HomeSpecialityState>(
      buildWhen:
          (previous, current) =>
              current is HomeSpecialityLoading ||
              current is HomeSpecialitySuccess ||
              current is HomeSpecialityFailure,

      builder: (context, state) {
        if (state is HomeSpecialityLoading) {
          return CircularProgressIndicator();
        } else if (state is HomeSpecialityFailure) {
          return setupShowingDialogForErrorState(
            context,
            errMsg: state.errorMessage,
          );
        } else if (state is HomeSpecialitySuccess) {
          return setUpSuccessStateWidget(state);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  Expanded setUpSuccessStateWidget(HomeSpecialitySuccess state) {
    return Expanded(
      child: Column(
        children: [
          SpecialityList(
            specializationList:
                state.homeSpecializationResponseModel.data ?? [],
          ),

          SizedBox(height: 20.h),

          DoctorListView(
            doctorModelList:
                state.homeSpecializationResponseModel.data?.first.doctors ?? [],
          ),
        ],
      ),
    );
  }
}
