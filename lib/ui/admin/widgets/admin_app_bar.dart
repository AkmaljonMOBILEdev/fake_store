import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/icons.dart';

class AdminAppBar extends StatelessWidget implements PreferredSize {
  const AdminAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: ClipOval(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.arrowBack),
                  ),
                ),
              )),
        ],
      ),
      centerTitle: true,
      title: const Text("Admin"),
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
