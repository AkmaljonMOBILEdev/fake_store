import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'icons.dart';

void showLoading({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Align(
          alignment: AlignmentDirectional.center,
          child: DecoratedBox(
            decoration: const BoxDecoration(), // Add your decoration styles if needed
            child: Center(
              child: SizedBox(
                height: 200.h, // Make sure you have defined .h extension method
                width: 200.w, // Make sure you have defined .w extension method
                child: Lottie.asset(AppIcons.loader),
              ),
            ),
          ),
        ),
      );
    },
  );
}

void hideLoading({required BuildContext? context}) async {
  if (context != null) Navigator.pop(context);
}
