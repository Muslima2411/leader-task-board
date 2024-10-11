import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_management_app/src/common/styles/app_colors.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';

import '../../../generated/assets.dart';
import 'bloc/calendar_view_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalendarViewCubit(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: EdgeInsets.only(
            top: 60.h,
            left: 24.w,
            right: 24.w,
          ),
          child: BlocBuilder<CalendarViewCubit, CalendarView>(
            builder: (context, view) {
              int headerFlex = view == CalendarView.month
                  ? 7
                  : view == CalendarView.year
                      ? 3
                      : 3;
              int listFlex = view == CalendarView.month
                  ? 6
                  : view == CalendarView.year
                      ? 5
                      : 7;
              return Column(
                children: [
                  Expanded(
                    flex: headerFlex,
                    child: Column(
                      children: [
                        _buildHeader(context),
                        SizedBox(height: 25.h),
                        _buildButtons(context),
                        SizedBox(height: 25.h),
                        _buildCalendar(context),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: listFlex,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (_, index) {
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
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              collapsedBackgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              collapsedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              controlAffinity: ListTileControlAffinity.trailing,
                              title: Text(
                                "UX Design",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(
                                "10:00 - 12:00",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFF8C8C8C),
                                ),
                              ),
                              children: [
                                Text("aaaaaaaaaa"),
                                Text("aaaaaaaaaa"),
                                Text("aaaaaaaaaa"),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localized.sentabr,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color:
                    Theme.of(context).colorScheme.onPrimary.withOpacity(0.45),
              ),
            ),
            Text(
              context.localized.today,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700,
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

  Widget _buildButtons(BuildContext context) {
    return BlocBuilder<CalendarViewCubit, CalendarView>(
      builder: (context, view) {
        final cubit = context.read<CalendarViewCubit>();

        return Container(
          width: 172.w,
          height: 45.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
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
                        : AppColors.black,
                  ),
                  onPressed: () => cubit.changeView(CalendarView.week),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    Assets.iconsCalendarWeek,
                    color: view == CalendarView.month
                        ? AppColors.green
                        : AppColors.black,
                  ),
                  onPressed: () => cubit.changeView(CalendarView.month),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    Assets.iconsCalendarMonth,
                    color: view == CalendarView.year
                        ? AppColors.green
                        : AppColors.black,
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

  Widget _buildCalendar(BuildContext context) {
    return BlocBuilder<CalendarViewCubit, CalendarView>(
      builder: (context, view) {
        return TableCalendar(
          locale: "ru",
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerVisible: false,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          calendarFormat: _getCalendarFormat(view),
          daysOfWeekHeight: 22.h,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              fontSize: 16.sp,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            weekendStyle: TextStyle(
              fontSize: 16.sp,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          calendarStyle: CalendarStyle(
            defaultTextStyle: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            cellMargin: EdgeInsets.symmetric(horizontal: 12),
            weekendTextStyle: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            todayTextStyle: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.green,
            ),
            todayDecoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.green,
                  width: 2.0.w,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  CalendarFormat _getCalendarFormat(CalendarView view) {
    switch (view) {
      case CalendarView.week:
        return CalendarFormat.week;
      case CalendarView.month:
        return CalendarFormat.month;
      case CalendarView.year:
        return CalendarFormat.twoWeeks;
      default:
        return CalendarFormat.week;
    }
  }
}
