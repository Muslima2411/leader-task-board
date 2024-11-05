import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile(
      {super.key,
      required this.title,
      required this.eventTime,
      required this.desc});

  final String title;
  final String eventTime;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.all(10),
        backgroundColor: Theme.of(context).colorScheme.primary,
        collapsedBackgroundColor: Theme.of(context).colorScheme.primary,
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        controlAffinity: ListTileControlAffinity.trailing,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          eventTime,
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xFF8C8C8C),
          ),
        ),
        children: [
          Text(
            desc,
            style: TextStyle(
              color: context.colorScheme.onPrimary,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
