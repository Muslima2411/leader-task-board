import 'package:flutter_bloc/flutter_bloc.dart';

// Enum to define the different calendar views
enum CalendarView { week, month, year }

class CalendarViewCubit extends Cubit<CalendarView> {
  CalendarViewCubit() : super(CalendarView.week);

  // Method to change the calendar view
  void changeView(CalendarView view) => emit(view);
}
