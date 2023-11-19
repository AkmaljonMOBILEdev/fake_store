import 'package:fake_store/cubits/login/login_cubit.dart';
import 'package:fake_store/ui/login/widgets/text_field.dart';
import 'package:fake_store/ui/widgets/global_button.dart';
import 'package:fake_store/utils/constants.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_route.dart';
import '../../utils/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if(state is LoginLoading){
              showLoading(context: context);
            }
            if(state is LoginLogged){
              hideLoading(context: context);
              Navigator.pushReplacementNamed(context, RouteNames.tabBox);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: editW(20), vertical: editH(40)),
              child: Column(
                children: [
                  Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  (height / 20).ph,
                  Expanded(
                    child: ListView(
                      children: [
                        LoginTextField(
                          title: "Username",
                          hintText: "Your username",
                          controller: nameController,
                        ),
                        30.ph,
                        LoginTextField(
                          title: "Password",
                          hintText: "********",
                          isPassword: true,
                          controller: passwordController,
                        ),
                      ],
                    ),
                  ),
                  GlobalButton(
                    title: "Login",
                    onTap: () {
                      context.read<LoginCubit>().login(context,
                          nameController.text, passwordController.text);
                    },
                  )
                ],
              ),
            );
          },
        ));
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
