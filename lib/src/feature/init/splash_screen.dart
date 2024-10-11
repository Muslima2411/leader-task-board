// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';
// import '../../../generated/assets.dart';
// import '../../common/local/app_storage.dart';
// import '../../common/routing/app_route_name.dart';
// import '../../common/widgets/custom_onboarding_widget.dart';
// import '../../data/entity/splash_screen_model.dart';
// import '../../common/widgets/custom_next_button_widget.dart';
// import 'bloc/splash_bloc.dart';
// import 'bloc/splash_event.dart';
// import 'bloc/splash_state.dart';
// import 'widgets/language_button_widget.dart';
// import 'widgets/page_indicator_widget.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   SplashScreenState createState() => SplashScreenState();
// }
//
// class SplashScreenState extends State<SplashScreen> {
//   late PageController _pageController;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<SplashScreenModel> listOfPages = [
//       SplashScreenModel(
//         imagePath: Assets.imagesSplashScreen1,
//         text: context.localized.splash_screen1,
//       ),
//       SplashScreenModel(
//         imagePath: Assets.imagesSplashScreen2,
//         text: context.localized.splash_screen2,
//       ),
//       SplashScreenModel(
//         imagePath: Assets.imagesSplashScreen3,
//         text: context.localized.splash_screen3,
//       ),
//     ];
//     return Scaffold(
//       // backgroundColor: Colors.amber,
//       appBar: AppBar(
//         backgroundColor: context.colorScheme.background,
//         actions: const <Widget>[
//           LanguageButtonWidget(),
//           SizedBox(width: 20),
//         ],
//       ),
//       body: BlocProvider(
//         create: (_) => SplashPageBloc(),
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 8,
//                 child: BlocBuilder<SplashPageBloc, SplashPageState>(
//                   builder: (context, state) {
//                     return PageView.builder(
//                       controller: _pageController,
//                       onPageChanged: (page) {
//                         context
//                             .read<SplashPageBloc>()
//                             .add(ChangeSelectedIndex(selectedIndex: page));
//                       },
//                       itemBuilder: (_, index) {
//                         var item = listOfPages[index];
//                         return CustomOnboardingWidget(
//                           text: item.text,
//                           imagePath: item.imagePath,
//                         );
//                       },
//                       itemCount: listOfPages.length,
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 50.h,
//               ),
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   children: [
//                     BlocBuilder<SplashPageBloc, SplashPageState>(
//                       builder: (context, state) {
//                         return PageIndicatorWidget(
//                           currentValue: state.selectedIndex,
//                         );
//                       },
//                     ),
//                     const Spacer(flex: 2),
//                     BlocBuilder<SplashPageBloc, SplashPageState>(
//                       builder: (context, state) {
//                         return CustomNextButtonWidget(
//                           text: state.selectedIndex == 2
//                               ? context.localized.start
//                               : context.localized.next,
//                           onPressed: () async {
//                             if (state.selectedIndex < 2) {
//                               _pageController.nextPage(
//                                 duration: const Duration(milliseconds: 500),
//                                 curve: Curves.fastLinearToSlowEaseIn,
//                               );
//                             } else {
//                               await AppStorage.$write(
//                                   key: StorageKey.splashVisited, value: 'true');
//                               context.go(AppRouteName.homePage);
//                             }
//                           },
//                         );
//                       },
//                     ),
//                     const Spacer(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
