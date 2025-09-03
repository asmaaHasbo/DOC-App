import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityList extends StatelessWidget {
  const SpecialityList({super.key});

  @override
  Widget build(BuildContext context) {
    // List<DoctorSpecialityItem> doctorSpecialityIte = [
    //   DoctorSpecialityItem(
    //     itemTitle: 'General',
    //     imgUrl: "assets/images/kidneys.png",
    //   ),
    //   DoctorSpecialityItem(
    //     itemTitle: 'Pediatric',
    //     imgUrl: "assets/images/baby.png",
    //   ),
    //   DoctorSpecialityItem(
    //     itemTitle: 'Kidneys',
    //     imgUrl: "assets/images/kidneys.png",
    //   ),
    //   DoctorSpecialityItem(
    //     itemTitle: 'Pediatric',
    //     imgUrl: "assets/images/baby.png",
    //   ),
    //   DoctorSpecialityItem(
    //     itemTitle: 'Kidneys',
    //     imgUrl: "assets/images/kidneys.png",
    //   ),
    //   DoctorSpecialityItem(
    //     itemTitle: 'Neurologic',
    //     imgUrl: "assets/images/brain.png",
    //   ),
    // ];

    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: 9,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0.0 : 16.w),
            child: null,
          );
        },
      ),
    );
  }
}
