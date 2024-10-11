import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/src/common/widgets/center_stick_widget.dart';
import '../../../../generated/assets.dart';
import '../../../feature/init/bloc/splash_bloc.dart';
import '../../../feature/init/bloc/splash_event.dart';
import '../../../feature/init/bloc/splash_state.dart';
import '../../bloc/local_cubit.dart';
import '../custom_next_button_widget.dart';
import 'language_picker_widget.dart';

class CustomLanguagePickerWidget extends StatelessWidget {
  const CustomLanguagePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String currentLang = "";
    return Column(
      children: <Widget>[
        // SizedBox(height: 20.h),
        BlocBuilder<SplashPageBloc, SplashPageState>(
          builder: (_, state) {
            return Column(
              children: [
                CustomEachLanguagePickerWidget(
                  onSelect: () {
                    currentLang = "uz";
                    context
                        .read<SplashPageBloc>()
                        .add(const ChangeCurrentLanguage("uz"));
                  },
                  language: "Узбекский",
                  selected:
                      state.currentLanguage == const Locale("uz").toString(),
                  countryFlag: Assets.imagesFlagUzb,
                ),
                CenterStickWidget(),
                CustomEachLanguagePickerWidget(
                  onSelect: () {
                    currentLang = "ru";
                    context
                        .read<SplashPageBloc>()
                        .add(const ChangeCurrentLanguage("ru"));
                  },
                  language: "Русский",
                  selected:
                      state.currentLanguage == const Locale("ru").toString(),
                  countryFlag: Assets.imagesFlagRus,
                ),
              ],
            );
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        // const Spacer(),
        CustomNextButtonWidget(
          // text: context.localized.choose,
          text: "Выбрать",
          onPressed: () {
            Navigator.pop(context);
            context.read<LocaleCubit>().changeLocale(
                  Locale(currentLang, currentLang.toUpperCase()),
                );
          },
        ),
      ],
    );
  }
}
