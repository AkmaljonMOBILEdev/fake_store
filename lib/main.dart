import 'package:fake_store/blocs/product/product_bloc.dart';
import 'package:fake_store/cubits/cart/cart_cubit.dart';
import 'package:fake_store/cubits/login/login_cubit.dart';
import 'package:fake_store/cubits/tab/tab_cubit.dart';
import 'package:fake_store/cubits/user_cart/user_cart_cubit.dart';
import 'package:fake_store/data/local/shared_pref/storage_repository.dart';
import 'package:fake_store/services/service_locator/service_locator.dart';
import 'package:fake_store/utils/app_route.dart';
import 'package:fake_store/utils/constants.dart';
import 'package:fake_store/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubits/category/category_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  getItSetup();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TabCubit()),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => UserCartCubit()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: Size(figmaWidth, figmaHeight),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.mainTheme,
          themeMode: ThemeMode.light,
          initialRoute: RouteNames.splash,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
