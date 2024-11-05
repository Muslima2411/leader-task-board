import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';

class PickDateWidget extends StatelessWidget {
  const PickDateWidget({super.key});

  Future<void> _pickDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2026),
    );
    // if (selected != null) {
    //   setState(() {
    //     _selectedDate = selected;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    DateTime? _selectedDate;

    return GestureDetector(
      onTap: () => _pickDate(context),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          _selectedDate != null
              ? "${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}"
              : "Select Date",
          style: TextStyle(
            fontSize: 16.sp,
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
