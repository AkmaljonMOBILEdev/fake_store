import 'package:fake_store/data/models/user/user_in_cart.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/size_extensions.dart';

class AdminDateIndicator extends StatelessWidget {
  const AdminDateIndicator({super.key, required this.user});
  final UserInCartModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: editW(20), vertical: editH(2)),
      child: RichText(
        text: TextSpan(
            text: "Date:  ",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.c6A6A6A),
            children: [
              TextSpan(
                  text: user.date.substring(0, 10),
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(
                    fontFamily: "Poppins",
                  ))
            ]),
      ),
    );
  }
}
