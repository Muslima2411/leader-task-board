import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/app_colors.dart';

class CustomThemePicker extends StatelessWidget {
  const CustomThemePicker({
    super.key,
    required this.onSelect,
    required this.mode,
    required this.selected,
    required this.color,
  });

  final VoidCallback onSelect;
  final String mode;
  final bool selected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      onPressed: () {
        onSelect();
        debugPrint("selected: $selected");
        debugPrint("mode: $mode");
        debugPrint("theme mode switched");
      },
      color: AppColors.transparent,
      elevation: 0,
      child: Row(
        children: [
          Icon(
            size: 22,
            selected
                ? Icons.radio_button_checked_sharp
                : Icons.radio_button_off_sharp,
            color: AppColors.green,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            mode,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          const Spacer(),
          Container(
            height: 22.h,
            width: 22.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.black,
                width: 0.8,
              ),
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
