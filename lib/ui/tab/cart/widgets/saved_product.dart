import 'package:fake_store/data/models/cart_sql/cart_sql.dart';
import 'package:fake_store/utils/colors.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants.dart';

class SavedProduct extends StatelessWidget {
  const SavedProduct({super.key, required this.cartSql});

  final CartSql cartSql;

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
                    cartSql.image,
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
                  cartSql.title.length > 20
                      ? cartSql.title.substring(0, 20)
                      : cartSql.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: width > 300 ? 14.sp: 16.sp,
                      fontWeight: FontWeight.w500, color: AppColors.c1A2530),
                ),
                6.ph,
                Text(
                  "\$ ${cartSql.price}",
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
