import 'package:fake_store/cubits/cart/cart_cubit.dart';
import 'package:fake_store/cubits/category/category_cubit.dart';
import 'package:fake_store/data/models/product/product_model.dart';
import 'package:fake_store/ui/tab/home/widgets/category_selector.dart';
import 'package:fake_store/ui/tab/home/widgets/home_app_bar.dart';
import 'package:fake_store/ui/tab/home/widgets/product_holder.dart';
import 'package:fake_store/ui/widgets/no_internet.dart';
import 'package:fake_store/utils/app_route.dart';
import 'package:fake_store/utils/constants.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/product/product_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String theCategory = "All";

  @override
  void initState() {
    context.read<ProductBloc>().add(FetchAllProducts(category: theCategory));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: editW(20)),
                child: Text(
                  "Select Category",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              CategorySelector(
                categories: state.categories!,
                onSelected: (onSelected) {
                  theCategory = onSelected;
                  context
                      .read<ProductBloc>()
                      .add(FetchAllProducts(category: theCategory));
                },
              ),
              BlocConsumer<ProductBloc, ProductState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductLoaded) {
                    List<ProductModel> products =
                        state.data.data as List<ProductModel>;
                    return products.isNotEmpty
                        ? Expanded(
                            child: GridView.count(
                            padding:
                                EdgeInsets.symmetric(horizontal: editW(20)),
                            physics: const BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            childAspectRatio: aspectRatio,
                            crossAxisSpacing: editW(20),
                            mainAxisSpacing: editH(20),
                            children: List.generate(products.length, (index) {
                              return ProductHolder(
                                product: products[index],
                                onMove: () {
                                  context.read<ProductBloc>().add(
                                      GetProductByID(id: products[index].id!));
                                  Navigator.pushNamed(
                                      context, RouteNames.detailed,
                                      arguments: theCategory);
                                },
                                onAdd: () {
                                  context
                                      .read<CartCubit>()
                                      .addToCart(products[index]);
                                },
                              );
                            }),
                          ))
                        : const NoInternetWidget();
                  } else if (state is ProductError) {
                    return const NoInternetWidget();
                  }
                  return const SizedBox();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
