import 'package:fake_store/cubits/user_cart/user_cart_cubit.dart';
import 'package:fake_store/ui/admin/widgets/admin_app_bar.dart';
import 'package:fake_store/ui/admin/widgets/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  void initState() {
    context.read<UserCartCubit>().callAllMethods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AdminAppBar(),
      body: BlocConsumer<UserCartCubit, UserCartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              UserInfoWidget(
                user: state.first,
                products: state.firstProducts,
              ),
              UserInfoWidget(
                user: state.second,
                products: state.secondProducts,

              ),
              UserInfoWidget(
                user: state.third,
                products: state.thirdProducts,

              ),
              UserInfoWidget(
                user: state.fourth,
                products: state.fourthProducts,

              ),
            ],
          );
        },
      ),
    );
  }
}
