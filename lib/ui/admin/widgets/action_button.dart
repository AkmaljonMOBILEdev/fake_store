import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/colors.dart';
import '../../../utils/icons.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.onAction, this.isUp=false});
  final bool isUp;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(8.r), bottomLeft: Radius.circular(8.r)),
      color: AppColors.c40A1FF,
      child: InkWell(
        splashColor: AppColors.cF7F7F9,
        onTap: onAction,
        child: Center(
          child: SvgPicture.asset(
            isUp?AppIcons.arrowUp:
            AppIcons.arrowDown,
            colorFilter:
                const ColorFilter.mode(AppColors.c1A2530, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
