import 'package:fake_store/utils/colors.dart';
import 'package:fake_store/utils/icons.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PriceHolder extends StatelessWidget {
  const PriceHolder({
    super.key,
    required this.subTotal,
    required this.delivery,
    required this.total,
  });

  final num subTotal;
  final num delivery;
  final num total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.c707B81),
            ),
            Text(
              "\$ ${subTotal.toStringAsFixed(2)}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.c1A2530, fontFamily: "Poppins"),
            )
          ],
        ),
        6.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.c707B81),
            ),
            Text(
              "\$ ${delivery.toStringAsFixed(2)}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.c1A2530, fontFamily: "Poppins"),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: editH(18)),
          child: SvgPicture.asset(AppIcons.divider),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total Cost",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.c2B2B2B),
            ),
            Text(
              "\$ ${total.toStringAsFixed(2)}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.c0D6EFD, fontFamily: "Poppins"),
            )
          ],
        ),
        24.ph
      ],
    );
  }
}
