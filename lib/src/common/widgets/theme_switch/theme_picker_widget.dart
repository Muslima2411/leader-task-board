import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';
import 'package:task_management_app/src/common/widgets/theme_switch/theme_widget.dart';

import '../../../../generated/assets.dart';
import '../custom_stick_widget.dart';

class CustomThemeWidget extends StatelessWidget {
  const CustomThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Column(
          children: <Widget>[
            const CustomStickWidget(),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Text(
                  "Выберите тему",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 20.sp,
                      ),
                ),
                const Spacer(),
                InkWell(
                  child: SvgPicture.asset(
                    Assets.iconsRoundClose,
                  ),
                  onTap: () => Navigator.pop(context),
                )
              ],
            ),
            const ThemeWidget(),
            // const SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
