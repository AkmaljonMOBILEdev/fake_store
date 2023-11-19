import 'package:fake_store/ui/admin/widgets/action_button.dart';
import 'package:fake_store/ui/admin/widgets/date_indicator.dart';
import 'package:fake_store/ui/admin/widgets/divider.dart';
import 'package:fake_store/ui/admin/widgets/user_product_holder.dart';
import 'package:fake_store/utils/colors.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/product/product_model.dart';
import '../../../data/models/user/user_in_cart.dart';
import '../../../utils/loading_dialog.dart';

class UserInfoWidget extends StatefulWidget {
  const UserInfoWidget({
    super.key,
    required this.user,
    required this.products,
  });

  final List<UserInCartModel> user;
  final List<ProductModel> products;

  @override
  State<UserInfoWidget> createState() => _UserInfoWidgetState();
}

class _UserInfoWidgetState extends State<UserInfoWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return widget.user.isNotEmpty
        ? AnimatedContainer(
            duration: const Duration(milliseconds: 3800),
            margin:
                EdgeInsets.symmetric(horizontal: editW(20), vertical: editH(8)),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.r)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: editW(8), vertical: editH(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "USER ${widget.user[0].userId}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontFamily: "Poppins",
                                color: AppColors.c1A2530),
                      ),
                      Text(
                        "Products: ${widget.user.length>1?(widget.user[0].products.length+widget.user[1].products.length):widget.user[0].products.length}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontFamily: "Poppins",
                                color: AppColors.c707B81),
                      )
                    ],
                  ),
                ),
                const AdminDivider(),
                ...List.generate(widget.user.length, (index) {
                  return AdminDateIndicator(user: widget.user[index]);
                }),
                const AdminDivider(),
                8.ph,
                isExpanded
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.r),
                                bottomRight: Radius.circular(8.r))),
                        child: widget.products.isNotEmpty?Column(
                          children: [
                            ...List.generate(widget.products.length, (index) {
                              return UserProductInCartHolder(
                                  product: widget.products[index]);
                            }),
                            ActionButton(
                              onAction: () {
                                setState(() {
                                  isExpanded = false;
                                });
                              },
                              isUp: true,
                            )
                          ],
                        ):const Center(child: CircularProgressIndicator()))
                    : ActionButton(
                        onAction: () {
                          setState(() {
                            isExpanded = true;
                          });
                        },
                      )
              ],
            ),
          )
        : const SizedBox();
  }
}
