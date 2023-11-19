import 'package:fake_store/blocs/product/product_bloc.dart';
import 'package:fake_store/cubits/cart/cart_cubit.dart';
import 'package:fake_store/data/models/product/product_model.dart';
import 'package:fake_store/ui/tab/home/sub_screens/widgets/add_button.dart';
import 'package:fake_store/ui/tab/home/sub_screens/widgets/detail_app_bar.dart';
import 'package:fake_store/ui/tab/home/sub_screens/widgets/image_holder.dart';
import 'package:fake_store/utils/colors.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/icons.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.category});

  final String category;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(
        onBack: () {
          context
              .read<ProductBloc>()
              .add(FetchAllProducts(category: widget.category));
          Navigator.pop(context);
        },
      ),
      body: WillPopScope(
        onWillPop: () async {
          context
              .read<ProductBloc>()
              .add(FetchAllProducts(category: widget.category));
          return true;
        },
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductSingleLoaded) {
              ProductModel productModel = state.data.data;
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: editW(20)),
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                productModel.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Expanded(flex: 1, child: SizedBox())
                          ],
                        ),
                        12.ph,
                        Text(
                          productModel.category[0].toUpperCase() +
                              productModel.category.substring(1),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: AppColors.c707B81),
                        ),
                        12.ph,
                        Text(
                          "\$${productModel.price}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Poppins"),
                        ),
                        DetailedImageHolder(imagePath: productModel.image),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.star,
                              width: editW(16),
                              height: editH(16),
                              colorFilter: const ColorFilter.mode(
                                  Colors.amber, BlendMode.srcIn),
                            ),
                            6.pw,
                            Text(
                              "${productModel.rating.rate}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                  color: AppColors.c0D6EFD,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        4.ph,
                        Text(
                          productModel.description,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: AppColors.c707B81,
                                  fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  AddButton(
                    onAdd: () {
                      context.read<CartCubit>().addToCart(productModel);
                    },
                  )
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
