import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';

class CenterStickWidget extends StatelessWidget {
  const CenterStickWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        width: double.infinity,
        height: 1,
        color: context.colorScheme.onPrimary,
      ),
    );
  }
}
