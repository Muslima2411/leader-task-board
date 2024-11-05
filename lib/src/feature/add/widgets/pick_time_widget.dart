import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';

class PickTimeWidget extends StatelessWidget {
  const PickTimeWidget({super.key});

  Future<void> _pickTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    // if (selected != null) {
    //   setState(() {
    //     _selectedTime = selected;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    TimeOfDay? _selectedTime;

    return GestureDetector(
      onTap: () => _pickTime(context),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          _selectedTime != null
              ? "${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')}"
              : "Select Time",
          style: TextStyle(
            fontSize: 16.sp,
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
