import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/styles/app_colors.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';
import 'package:task_management_app/src/common/widgets/custom_next_button_widget.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.transparent,
        leading: Icon(
          Icons.arrow_back_ios_new,
        ),
        title: Text(
          context.localized.create_new_tasks,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
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
              Text(
                context.localized.new_tasks,
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                maxLength: 25,
                decoration: InputDecoration(
                  hintText: "UX Design",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
              ),
              Text(
                context.localized.categories,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          minWidth: 100.w,
                          elevation: 0,
                          color: index == 0
                              ? AppColors.green
                              : AppColors.green.withOpacity(0.2),
                          child: Text(
                            context.localized.design,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                context.localized.date,
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                context.localized.start_time,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                context.localized.desc,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  hintText:
                      "Dive deep into your work habits with our comprehensive research tools. Analyze how you and your team are performing over time, identify bottlenecks, and uncover insights to improve productivity. ",
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomNextButtonWidget(
                text: context.localized.create,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
