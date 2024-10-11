import 'package:flutter/material.dart';

import '../../../common/styles/app_colors.dart';

class ArenaIconButton extends StatelessWidget {
  const ArenaIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(40, 40),
        shape: const CircleBorder(),
        backgroundColor: AppColors.white,
        overlayColor: AppColors.green,
      ),
      child: Icon(
        icon,
        color: AppColors.green,
      ),
    );
  }
}
