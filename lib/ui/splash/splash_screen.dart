import 'dart:async';
import 'package:fake_store/utils/app_route.dart';
import 'package:fake_store/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../data/local/shared_pref/storage_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0;

  _init() async {
    await Future.delayed(const Duration(seconds: 2));
    String token = StorageRepository.getString("isLogged");
    if (context.mounted) {
      Navigator.pushReplacementNamed(
          context, token.isNotEmpty ? RouteNames.tabBox : RouteNames.login);
    }
  }

  @override
  void initState() {
    _init();
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        opacity = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c0D6EFD,
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(seconds: 2),
        child: Center(
          child: Text(
            "My Store",
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
