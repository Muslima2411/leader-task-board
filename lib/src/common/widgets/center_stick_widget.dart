import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        color: Colors.black26,
      ),
    );
  }
}
