import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../common/styles/app_colors.dart';
import '../bloc/calendar_view_cubit.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var localeCode = Localizations.localeOf(context).languageCode;
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;

    // void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    //   if (!isSameDay(_selectedDay, selectedDay)) {
    //     setState(() {
    //       _selectedDay = selectedDay;
    //       _focusedDay = focusedDay;
    //       _rangeStart = null;
    //       _rangeEnd = null;
    //       _rangeSelectionMode = RangeSelectionMode.toggledOff;
    //     });
    //     _selectedEvents.value = _getEventsForDay(selectedDay);
    //   }
    // }

    return BlocBuilder<CalendarViewCubit, CalendarView>(
      builder: (context, view) {
        return TableCalendar(
          locale: localeCode,
          rowHeight: 48.h,
          startingDayOfWeek: StartingDayOfWeek.monday,
          // headerVisible: false,
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: _getCalendarFormat(view),
          daysOfWeekHeight: 20.h,
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
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
            selectedDecoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.green,
                  width: 2.0.w,
                ),
              ),
            ),
            selectedTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
            defaultTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            cellMargin: EdgeInsets.symmetric(horizontal: 12),
            weekendTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            todayTextStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
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
