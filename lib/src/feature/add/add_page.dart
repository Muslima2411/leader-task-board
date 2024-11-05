import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/styles/app_colors.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';
import 'package:task_management_app/src/common/widgets/custom_next_button_widget.dart';
import 'package:task_management_app/src/common/widgets/text_field_widget.dart';
import 'package:task_management_app/src/feature/add/widgets/category_list_widget.dart';
import 'package:task_management_app/src/feature/add/widgets/header_text_widget.dart';
import 'package:task_management_app/src/feature/add/widgets/pick_date_widget.dart';
import 'package:task_management_app/src/feature/add/widgets/pick_time_widget.dart';
import 'package:task_management_app/src/feature/add/widgets/spacer_widget.dart';

import '../../common/widgets/back_button_widget.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.transparent,
        leading: BackButtonWidget(),
        title: HeaderTextWidget(
          context.localized.create_new_tasks,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 25.w,
            right: 25.w,
            top: 10.h,
            bottom: 100.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderTextWidget(context.localized.new_tasks),
              SpacerWidget(height: 30),
              TextFieldWidget(
                controller: titleController,
                hintText: "UX Design",
              ),
              HeaderTextWidget(context.localized.categories),
              SpacerWidget(),
              CategoryListWidget(),
              SpacerWidget(),
              HeaderTextWidget(context.localized.date),
              SpacerWidget(),
              PickDateWidget(),
              SpacerWidget(),
              HeaderTextWidget(context.localized.start_time),
              SpacerWidget(),
              PickTimeWidget(),
              SpacerWidget(),
              HeaderTextWidget(context.localized.desc),
              SpacerWidget(),
              TextFieldWidget(
                maxLines: 5,
                controller: descriptionController,
                hintText:
                    "Dive deep into your work habits with our comprehensive research tools...",
              ),
              SpacerWidget(height: 30),
              CustomNextButtonWidget(
                text: context.localized.create,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
