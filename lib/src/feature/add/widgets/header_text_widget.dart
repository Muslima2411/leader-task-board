import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget(this.child, {super.key});
  final String child;

  @override
  Widget build(BuildContext context) {
    return Text(
      child,
      style: TextStyle(
        fontSize: 20.sp,
        color: context.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
