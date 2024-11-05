import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';

import '../../../../generated/assets.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${getMonthName(today.month, context)} - ${today.day}",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.45),
              ),
            ),
            Text(
              context.localized.today,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
        const Spacer(),
        Image.asset(
          Assets.imagesAvatar,
          width: 40.w,
          height: 40.h,
        ),
      ],
    );
  }
}

String getMonthName(int monthNumber, BuildContext context) {
  List<String> monthNames = [
    context.localized.january,
    context.localized.february,
    context.localized.march,
    context.localized.april,
    context.localized.may,
    context.localized.june,
    context.localized.july,
    context.localized.august,
    context.localized.september,
    context.localized.october,
    context.localized.november,
    context.localized.december,
  ];

  if (monthNumber < 1 || monthNumber > 12) return "Invalid month";

  return monthNames[monthNumber - 1];
}
