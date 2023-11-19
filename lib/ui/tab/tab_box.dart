import 'package:fake_store/cubits/tab/tab_cubit.dart';
import 'package:fake_store/cubits/user_cart/user_cart_cubit.dart';
import 'package:fake_store/ui/tab/cart/cart_screen.dart';
import 'package:fake_store/ui/tab/home/home_screen.dart';
import 'package:fake_store/utils/colors.dart';
import 'package:fake_store/utils/icons.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.addAll(const [HomeScreen(), CartScreen()]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TabCubit, TabState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.index,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              _getItem(icon: AppIcons.home),
              _getItem(icon: AppIcons.cart),
              // _getItem(icon: AppIcons.profile),
            ],
            currentIndex: context.watch<TabCubit>().state.index,
            onTap: context.read<TabCubit>().changeIndex,
          ),
        );
      },
    );
  }
  BottomNavigationBarItem _getItem({
    required String icon,
  }) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        icon,
        height: editH(24),
        width: editW(24),
        colorFilter: const ColorFilter.mode(
          AppColors.c0D6EFD,
          BlendMode.srcIn,
        ),
      ),
      icon: SvgPicture.asset(
        icon,
        height: editH(24),
        width: editW(24),
        colorFilter: const ColorFilter.mode(
          AppColors.c707B81,
          BlendMode.srcIn,
        ),
      ),
      label: "",
    );
  }
}
