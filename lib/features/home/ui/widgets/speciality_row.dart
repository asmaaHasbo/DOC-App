import 'package:doc_app/core/themes/colors/app_colors.dart';
import 'package:doc_app/core/themes/colors/styles/styles.dart';
import 'package:flutter/material.dart';

class SpecialityRow extends StatelessWidget {
  const SpecialityRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Doctor Speciality', style: AppStyles.font18W600Black),
        const Spacer(),
        Text(
          'See All',
          style: AppStyles.font12W400Gray9E.copyWith(color: AppColors.primary),
        ),
      ],
    );
  }
}
