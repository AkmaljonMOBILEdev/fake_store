import 'package:fake_store/data/models/product/product_model.dart';
import 'package:fake_store/utils/colors.dart';
import 'package:fake_store/utils/icons.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductHolder extends StatelessWidget {
  const ProductHolder({
    super.key,
    required this.product,
    required this.onMove,
    required this.onAdd,
  });

  final ProductModel product;
  final VoidCallback onMove;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onMove,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14.r),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: editW(20), top: editH(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Image.network(product.image,
                              width: editW(160), height: editH(84))),
                      6.ph,
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.star,
                            width: editW(16),
                            height: editH(16),
                            colorFilter: const ColorFilter.mode(
                                Colors.amber, BlendMode.srcIn),
                          ),
                          6.pw,
                          Text(
                            "${product.rating.rate}",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: AppColors.c0D6EFD,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      4.ph,
                      Expanded(
                        child: Text(
                          product.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppColors.c6A6A6A, fontSize: 12.sp),
                        ),
                      ),
                      20.ph,
                      Text(
                        "\$ ${product.price}",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ZoomTapAnimation(
                    onTap: onAdd,
                    child: SvgPicture.asset(AppIcons.plus))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
