import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/icons.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AppIcons.noInternet),
        Text(
          "No connection!",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Colors.red),
        )
      ],
    );
  }
}
