import 'package:doc_app/features/home/logic/cubit/home_cubit.dart';
import 'package:doc_app/features/home/ui/widgets/doctor_list_view.dart';
import 'package:doc_app/features/home/ui/widgets/find_doctor_container.dart';
import 'package:doc_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:doc_app/features/home/ui/widgets/speciality_list_view.dart';
import 'package:doc_app/features/home/ui/widgets/speciality_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/shared_widgets/setup_showing_dialog_for_error_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Column(
            children: [
              HomeTopBar(),

              SizedBox(height: 20.h),

              FindDoctorContainer(),

              SizedBox(height: 20.h),

              SpecialityRow(),

              SizedBox(height: 20.h),

              BlocBuilder<HomeSpecialityCubit, HomeSpecialityState>(
                builder: (context, state) {
                  if (state is HomeSpecialityLoading) {
                    return CircularProgressIndicator();
                  } else if (state is HomeSpecialityFailure) {
                    return setupShowingDialogForErrorState(
                      context,
                      errMsg: state.errorMessage,
                    );
                  } else if (state is HomeSpecialitySuccess) {
                    return Expanded(
                      child: Column(
                        children: [
                          SpecialityList(),

                          SizedBox(height: 20.h),

                          DoctorListView(),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
