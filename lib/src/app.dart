import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:nested/nested.dart";
import 'package:task_management_app/src/feature/main/main_wrapper.dart';
import 'package:task_management_app/src/feature/profile/bloc/profile_bloc.dart';
import '../generated/l10n.dart';
import 'common/bloc/local_cubit.dart';
import 'feature/home/bloc/calendar_view_cubit.dart';
import "feature/init/bloc/splash_bloc.dart";
import "feature/main/bloc/bottom_nav.dart";
import "feature/settings/inherited/theme_controller.dart";

class MyApp extends StatelessWidget {
  MyApp({super.key}) : builderKey = GlobalKey();

  final GlobalKey builderKey;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: <SingleChildWidget>[
            BlocProvider(create: (BuildContext context) => BottomNavCubit()),
            BlocProvider(create: (BuildContext context) => SplashPageBloc()),
            BlocProvider(create: (BuildContext context) => ProfileBloc()),
            BlocProvider(create: (context) => LocaleCubit()),
            BlocProvider(create: (context) => CalendarViewCubit()),
            BlocProvider(create: (context) => ThemeCubit()),
            // BlocProvider(create: (context) => ThemeCubit()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, theme) {
              return BlocBuilder<LocaleCubit, Locale>(
                builder: (context, locale) {
                  return MaterialApp(
                    home: MainWrapper(),
                    debugShowCheckedModeBanner: false,
                    onGenerateTitle: (BuildContext context) =>
                        "Project Nurullayevlar",
                    localizationsDelegates: [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: [
                      const Locale('ru', 'RU'),
                      const Locale('uz', 'UZ'),
                    ],
                    locale: locale,
                    theme: theme,
                    localeResolutionCallback: (Locale? deviceLocale,
                        Iterable<Locale> supportedLocales) {
                      return supportedLocales.firstWhere(
                        (Locale locale) =>
                            locale.languageCode == deviceLocale?.languageCode,
                        orElse: () => const Locale("ru"),
                      );
                    },
                    // routerConfig: AppRouter.router,
                    builder: (BuildContext context, Widget? child) {
                      return MediaQuery.withNoTextScaling(
                        key: builderKey,
                        child: child ?? const SizedBox.shrink(),
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
