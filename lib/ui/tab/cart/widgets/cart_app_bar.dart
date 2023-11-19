import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../cubits/cart/cart_cubit.dart';
import '../../../../utils/icons.dart';
import 'dialog.dart';

class CartAppBar extends StatelessWidget implements PreferredSize {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("My Cart"),
      actions: [
        Visibility(
          visible: context.watch<CartCubit>().state.productsInCart.isNotEmpty,
          child: IconButton(
              onPressed: () {
                showConfirmDialog(context);
              },
              icon: SvgPicture.asset(AppIcons.delete)),
        )
      ],
    );
  }

  @override
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => Size(double.infinity, editH(56));
}
