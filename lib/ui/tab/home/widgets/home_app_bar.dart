import 'package:fake_store/utils/app_route.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/icons.dart';

class HomeAppBar extends StatelessWidget implements PreferredSize {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: null,
          icon: SvgPicture.asset(
            AppIcons.menu,
          )),
      centerTitle: true,
      title: Text(
        "Explore",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.admin);
            },
            icon: ClipOval(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(AppIcons.admin),
                ),
              ),
            )),
        10.pw
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
