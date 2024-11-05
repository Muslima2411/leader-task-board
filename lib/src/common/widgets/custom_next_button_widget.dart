import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';

import '../styles/app_colors.dart';

class CustomNextButtonWidget extends StatelessWidget {
  const CustomNextButtonWidget(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 46.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      minWidth: MediaQuery.of(context).size.width,
      color: AppColors.green,
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
