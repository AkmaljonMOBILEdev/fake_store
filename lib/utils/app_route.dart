import 'package:fake_store/ui/admin/admin_screen.dart';
import 'package:fake_store/ui/login/login_screen.dart';
import 'package:fake_store/ui/tab/cart/cart_screen.dart';
import 'package:fake_store/ui/tab/home/home_screen.dart';
import 'package:fake_store/ui/tab/home/sub_screens/product_detail.dart';
import 'package:fake_store/ui/tab/tab_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/splash/splash_screen.dart';

class RouteNames {
  static const String splash = "/";
  static const String login = "/login";
  static const String tabBox = "/tab_box";
  static const String home = "/home";
  static const String cart = "/cart";
  static const String detailed = "/detailed";
  static const String admin = "/admin";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (context) => const TabBox());
      case RouteNames.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RouteNames.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RouteNames.cart:
        return MaterialPageRoute(builder: (context) => const CartScreen());
      case RouteNames.detailed:
        return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
                  category: settings.arguments as String,
                ));
      case RouteNames.admin:
        return MaterialPageRoute(builder: (context) => const AdminScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("App is out of the system!"),
                  ),
                ));
    }
  }
}
