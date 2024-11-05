import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/data/repository/app_repository_impl.dart';
import 'package:task_management_app/src/feature/home/bloc/tasks_bloc.dart';
import 'package:task_management_app/src/feature/home/bloc/tasks_event.dart';
import 'package:task_management_app/src/feature/home/widgets/calendar_buttons_widget.dart';
import 'package:task_management_app/src/feature/home/widgets/calendar_widget.dart';
import 'package:task_management_app/src/feature/home/widgets/custom_expansion_tile.dart';
import 'package:task_management_app/src/feature/home/widgets/header_widget.dart';

import 'bloc/tasks_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AppRepositoryImpl appRepositoryImpl = AppRepositoryImpl();

    return BlocProvider(
      create: (context) => TaskBloc(appRepositoryImpl)..add(GetTasks()),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 60.h,
              left: 24.w,
              right: 24.w,
            ),
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TaskError) {
                  return Center(child: Text(state.message));
                } else if (state is TaskLoaded) {
                  return Column(
                    children: [
                      HeaderWidget(),
                      SizedBox(height: 10.h),
                      CalendarButtonsWidget(),
                      CalendarWidget(),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.tasks.keys.length,
                        itemBuilder: (_, index) {
                          final date = state.tasks.keys.elementAt(index);
                          final taskList = state.tasks[date]!;

                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: taskList.length,
                              itemBuilder: (_, i) {
                                return CustomExpansionTile(
                                  // key: ValueKey(date),
                                  title: taskList[i].goal,
                                  eventTime: taskList[i].eventTime,
                                  desc: taskList[i].descriptions,
                                );
                              });
                        },
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text('Unexpected state'));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
