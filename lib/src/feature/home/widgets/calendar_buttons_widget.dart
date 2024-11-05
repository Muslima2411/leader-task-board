import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';

import '../../../../generated/assets.dart';
import '../../../common/styles/app_colors.dart';
import '../bloc/calendar_view_cubit.dart';

class CalendarButtonsWidget extends StatelessWidget {
  const CalendarButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarViewCubit, CalendarView>(
      builder: (context, view) {
        final cubit = context.read<CalendarViewCubit>();

        return Container(
          width: 180.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    Assets.iconsWeeklyCalendar,
                    color: view == CalendarView.week
                        ? AppColors.green
                        : context.colorScheme.onPrimary,
                  ),
                  onPressed: () => cubit.changeView(CalendarView.week),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    Assets.iconsCalendarWeek,
                    color: view == CalendarView.month
                        ? AppColors.green
                        : context.colorScheme.onPrimary,
                  ),
                  onPressed: () => cubit.changeView(CalendarView.month),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    Assets.iconsCalendarMonth,
                    color: view == CalendarView.year
                        ? AppColors.green
                        : context.colorScheme.onPrimary,
                  ),
                  onPressed: () => cubit.changeView(CalendarView.year),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
