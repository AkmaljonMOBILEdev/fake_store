import 'package:fake_store/data/models/cart_sql/cart_sql.dart';
import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/size_extensions.dart';

class ItemCountIndicator extends StatelessWidget {
  const ItemCountIndicator({super.key, required this.theCart});

  final List<CartSql> theCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: editW(20)),
      child: Text(
        theCart.length < 2
            ? "${theCart.length} item"
            : "${theCart.length} items",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.c1A2530,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
