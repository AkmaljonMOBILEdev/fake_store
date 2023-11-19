import 'package:fake_store/data/models/product/product_model.dart';
import 'package:fake_store/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors.dart';
import '../../../utils/size_extensions.dart';

class UserProductInCartHolder extends StatelessWidget {
  const UserProductInCartHolder({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: editH(7)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(editW(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                color: AppColors.cF7F7F9,
                child: Center(
                  child: Image.network(
                    product.image,
                    fit: BoxFit.contain,
                    width: editW(66),
                    height: editH(66),
                  ),
                ),
              ),
            ),
            30.pw,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.title.length > 20
                      ? product.title.substring(0, 20)
                      : product.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: width > 300 ? 14.sp: 16.sp,
                      fontWeight: FontWeight.w500, color: AppColors.c1A2530),
                ),
                6.ph,
                Text(
                  "\$ ${product.price}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontFamily: "Poppins", color: AppColors.c1A2530),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
