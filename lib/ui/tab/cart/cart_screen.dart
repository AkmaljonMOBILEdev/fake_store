import 'package:fake_store/cubits/cart/cart_cubit.dart';
import 'package:fake_store/cubits/user_cart/user_cart_cubit.dart';
import 'package:fake_store/data/models/cart_sql/cart_sql.dart';
import 'package:fake_store/ui/tab/cart/widgets/cart_app_bar.dart';
import 'package:fake_store/ui/tab/cart/widgets/item_count_indicator.dart';
import 'package:fake_store/ui/tab/cart/widgets/price_holder.dart';
import 'package:fake_store/ui/tab/cart/widgets/saved_product.dart';
import 'package:fake_store/ui/widgets/global_button.dart';
import 'package:fake_store/utils/icons.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartCubit>().getFromCart();
    context.read<CartCubit>().countPrices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<CartSql> theCart = context.watch<CartCubit>().state.productsInCart;
    return Scaffold(
      appBar: const CartAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemCountIndicator(theCart: theCart),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: editW(20)),
                  children: [
                    ...List.generate(state.productsInCart.length, (index) {
                      CartSql item = state.productsInCart[index];
                      return Dismissible(
                          direction: DismissDirection.endToStart,
                          background: Padding(
                            padding: EdgeInsets.symmetric(vertical: editH(10)),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Colors.red,
                              ),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: null,
                                  icon: SvgPicture.asset(
                                    AppIcons.delete,
                                    colorFilter: const ColorFilter.mode(
                                        Colors.white, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onDismissed: (direction) {
                            context.read<CartCubit>().deleteFromCart(item.id!);
                          },
                          key: ValueKey(item.id),
                          child: SavedProduct(cartSql: item));
                    })
                  ],
                ),
              );
            },
          ),
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(editW(20)),
              child: Column(
                children: [
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return PriceHolder(
                        subTotal: state.subTotal,
                        delivery: state.delivery,
                        total: state.totalCost,
                      );
                    },
                  ),
                  GlobalButton(
                    title: "Checkout",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
