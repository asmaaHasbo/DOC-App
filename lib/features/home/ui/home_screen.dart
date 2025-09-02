import 'package:doc_app/features/home/ui/widgets/doctor_list_view.dart';
import 'package:doc_app/features/home/ui/widgets/doctor_speciality_list.dart';
import 'package:doc_app/features/home/ui/widgets/doctor_speciality_row.dart';
import 'package:doc_app/features/home/ui/widgets/find_doctor_container.dart';
import 'package:doc_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

              DoctorSpecialityRow(),

              SizedBox(height: 20.h),

              DoctorSpecialityList(),

              SizedBox(height: 20.h),

              DoctorListView(),
            ],
          ),
        ),
      ),
    );
  }
}
