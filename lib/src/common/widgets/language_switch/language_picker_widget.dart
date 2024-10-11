import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../styles/app_colors.dart';

class CustomEachLanguagePickerWidget extends StatelessWidget {
  const CustomEachLanguagePickerWidget({
    super.key,
    required this.onSelect,
    required this.language,
    required this.selected,
    required this.countryFlag,
  });

  final VoidCallback onSelect;
  final String language;
  final bool selected;
  final String countryFlag;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      onPressed: () {
        onSelect();
        debugPrint("language switched");
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
            language,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          const Spacer(),
          Image.asset(
            countryFlag,
          ),
        ],
      ),
    );
  }
}
