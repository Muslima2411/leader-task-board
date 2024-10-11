import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/styles/app_colors.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';
import 'package:task_management_app/src/feature/profile/widgets/custom_button_widget.dart';

import '../../../generated/assets.dart';
import '../../common/widgets/language_switch/language_widget.dart';
import '../../common/widgets/theme_switch/theme_picker_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        automaticallyImplyLeading: false,
        title: Text(
          context.localized.profile_title,
          style: TextStyle(
            fontSize: 20.sp,
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
          vertical: 60.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesProfile),
            SizedBox(
              height: 65.h,
            ),
            Text(
              "Ozodbek Abdulkadirov",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Text(
              context.localized.settings,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8C8C8C),
              ),
            ),
            SizedBox(
              height: 65.h,
            ),
            CustomButtonWidget(
              text: context.localized.profile_language,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      const LanguageSelectionBottomSheetWidget(),
                );
              },
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomButtonWidget(
              text: context.localized.profile_theme,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const CustomThemeWidget(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
