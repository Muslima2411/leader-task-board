// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';
//
// import '../../../generated/assets.dart';
// import '../../common/styles/app_colors.dart';
// import '../home/home_page.dart';
// import 'bloc/bottom_nav.dart';
//
// class MainWrapper extends StatefulWidget {
//   final Widget child;
//   const MainWrapper({super.key, required this.child});
//
//   @override
//   State<MainWrapper> createState() => _MainWrapperState();
// }
//
// class _MainWrapperState extends State<MainWrapper> {
//   late PageController pageController;
//
//   @override
//   void initState() {
//     super.initState();
//     pageController = PageController();
//   }
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     super.dispose();
//   }
//
//   /// Top Level Pages
//   final List<Widget> topLevelPages = const [
//     HomePage(),
//   ];
//
//   /// on Page Changed
//   void onPageChanged(int page) {
//     BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ColorScheme contextColor = Theme.of(context).colorScheme;
//     return Scaffold(
//       backgroundColor: contextColor.background,
//       body: Stack(
//         children: [
//           // widget.child,
//           _mainWrapperBody(),
//         ],
//       ),
//       bottomNavigationBar: _mainWrapperBottomNavBar(context),
//     );
//   }
//
//   // Bottom Navigation Bar - MainWrapper Widget
//   BottomAppBar _mainWrapperBottomNavBar(BuildContext context) {
//     return BottomAppBar(
//       color: Theme.of(context).colorScheme.primary,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _bottomAppBarItem(
//                   context,
//                   defaultIcon: Assets.iconsHomeDefault,
//                   page: 0,
//                   label: context.localized.main_home,
//                   filledIcon: Assets.iconsHomeFilled,
//                 ),
//                 _bottomAppBarItem(
//                   context,
//                   defaultIcon: Assets.iconsHeartOutlined,
//                   page: 1,
//                   label: context.localized.main_favs,
//                   filledIcon: Assets.iconsHeartOutlined,
//                 ),
//                 _bottomAppBarItem(
//                   context,
//                   defaultIcon: Assets.iconsProfileDefault,
//                   page: 2,
//                   label: context.localized.main_profil,
//                   filledIcon: Assets.iconsProfileFilled,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//

//   // Bottom Navigation Bar Single item - MainWrapper Widget
//   Widget _bottomAppBarItem(
//     BuildContext context, {
//     required String defaultIcon,
//     required int page,
//     required String label,
//     required String filledIcon,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
//         pageController.animateToPage(
//           page,
//           duration: const Duration(
//             milliseconds: 500,
//           ),
//           curve: Curves.fastLinearToSlowEaseIn,
//         );
//       },
//       child: Container(
//         color: AppColors.transparent,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(
//               height: 10,
//             ),
//             SvgPicture.asset(
//               context.watch<BottomNavCubit>().state == page
//                   ? filledIcon
//                   : defaultIcon,
//               height: 26,
//               width: 26,
//               color: context.watch<BottomNavCubit>().state == page
//                   ? AppColors.green
//                   : AppColors.navbarIcon,
//             ),
//             const SizedBox(
//               height: 3,
//             ),
//             Text(
//               label,
//               style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                     color: context.watch<BottomNavCubit>().state == page
//                         ? AppColors.green
//                         : AppColors.navbarIcon,
//                     fontWeight: context.watch<BottomNavCubit>().state == page
//                         ? FontWeight.w600
//                         : FontWeight.w400,
//                     fontSize: 12.sp,
//                     fontFamily: "Poppins",
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/src/common/styles/app_colors.dart';
import 'package:task_management_app/src/feature/home/home_page.dart';

import '../add/add_page.dart';
import '../profile/profile_page.dart';
import 'bloc/bottom_nav.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late PageController pageController;

  List<Widget> listOfPages = [
    HomePage(),
    AddPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// on Page Changed
  void onPageChanged(int page) {
    BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
  }

  /// Body - MainWrapper Widget
  PageView _mainWrapperBody() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (int page) => onPageChanged(page),
      controller: pageController,
      children: listOfPages,
    );
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        selectedIndex = state;
        return Scaffold(
          body: _mainWrapperBody(),
          extendBody: true,
          backgroundColor: AppColors.transparent,
          bottomNavigationBar: CurvedNavigationBar(
            color: Theme.of(context).colorScheme.primary,
            backgroundColor: AppColors.transparent,
            buttonBackgroundColor: AppColors.green,
            items: [
              Icon(
                Icons.list,
                size: 32,
              ),
              Icon(
                Icons.add,
                size: 32,
              ),
              Icon(
                Icons.person,
                size: 32,
              ),
            ],
            onTap: (index) {
              BlocProvider.of<BottomNavCubit>(context)
                  .changeSelectedIndex(index);
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            },
          ),
        );
      },
    );
  }
}
