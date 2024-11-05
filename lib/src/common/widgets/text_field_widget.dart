import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';

import '../styles/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    this.maxLines = 1,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.done,
      maxLines: maxLines,
      style: TextStyle(
        color: context.colorScheme.onPrimary,
      ),
      cursorColor: context.colorScheme.onPrimary,
      cursorErrorColor: AppColors.green,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
        ),
        hintText: hintText,
      ),
    );
  }
}
