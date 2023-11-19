import 'package:fake_store/cubits/tab/tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utils/icons.dart';

class DetailAppBar extends StatelessWidget implements PreferredSize {
  const DetailAppBar({super.key, required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          IconButton(
              onPressed: onBack,
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
      title: Text(
        "My Shop",
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: [
        IconButton(
            onPressed: () {
              context.read<TabCubit>().changeIndex(1);
              Navigator.pop(context);
            },
            icon: ClipOval(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: SvgPicture.asset(AppIcons.cart),
                  ),
                ),
              ),
            )),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
