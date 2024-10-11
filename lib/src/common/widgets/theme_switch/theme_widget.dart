import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/widgets/center_stick_widget.dart';
import '../../../feature/profile/bloc/profile_bloc.dart';
import '../../../feature/profile/bloc/profile_event.dart';
import '../../../feature/profile/bloc/profile_state.dart';
import '../../../feature/settings/inherited/theme_controller.dart';
import '../../styles/app_colors.dart';
import '../custom_next_button_widget.dart';
import 'custom_theme_picker.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, profileState) {
        final isLightMode = profileState.isLightMode;

        return Column(
          children: <Widget>[
            SizedBox(height: 20.h),
            Column(
              children: [
                CustomThemePicker(
                  onSelect: () {
                    context.read<ProfileBloc>().add(SetLightMode(true));
                  },
                  mode: "Светлый режим",
                  selected: isLightMode!,
                  color: AppColors.white,
                ),
                CenterStickWidget(),
                CustomThemePicker(
                  onSelect: () {
                    context.read<ProfileBloc>().add(SetLightMode(false));
                  },
                  mode: "Тёмный режим",
                  selected: !isLightMode,
                  color: AppColors.black,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomNextButtonWidget(
              text: "Выбрать",
              onPressed: () {
                final themeCubit = context.read<ThemeCubit>();
                final isSelectedLightMode =
                    context.read<ProfileBloc>().state.isLightMode;
                themeCubit.setTheme(isSelectedLightMode!);
                debugPrint("isSelectedLightMode: $isSelectedLightMode");
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
