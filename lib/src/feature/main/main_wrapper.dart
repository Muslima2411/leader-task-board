import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_management_app/src/common/styles/app_colors.dart';
import 'package:task_management_app/src/common/utils/extensions/context_extensions.dart';
import 'package:task_management_app/src/feature/home/home_page.dart';

import '../../../generated/assets.dart';
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

  void onPageChanged(int page) {
    BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
  }

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
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => AddPage(),
                ),
              );
            },
            shape: CircleBorder(),
            backgroundColor: AppColors.green,
            child: SvgPicture.asset(
              Assets.iconsPlus,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: context.colorScheme.primary,
            notchMargin: 8.0,
            child: CustomPaint(
              painter: _BottomAppBarPainter(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      Assets.iconsList,
                      color: selectedIndex == 0
                          ? AppColors.green
                          : context.colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      BlocProvider.of<BottomNavCubit>(context)
                          .changeSelectedIndex(0);
                      pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    icon: SvgPicture.asset(
                      Assets.iconsProfile,
                      color: selectedIndex == 1
                          ? AppColors.green
                          : context.colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      BlocProvider.of<BottomNavCubit>(context)
                          .changeSelectedIndex(2);
                      pageController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BottomAppBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.transparent
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.35, 0);
    path.quadraticBezierTo(
      size.width * 0.5,
      50, // Height of the curve
      size.width * 0.65,
      0,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
