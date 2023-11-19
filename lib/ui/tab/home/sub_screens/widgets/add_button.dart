import 'package:fake_store/utils/icons.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../utils/colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onAdd});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: editW(20), vertical: editH(20)),
      child: Material(
        borderRadius: BorderRadius.circular(14.r),
        color: AppColors.c0D6EFD,
        child: InkWell(
          onTap: onAdd,
          borderRadius: BorderRadius.circular(14.r),
          splashColor: AppColors.c40A1FF,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: editW(48), vertical: editH(10)),
            child: SizedBox(
              // width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.whiteCart),
                  16.pw,
                  Text(
                    "Add to Cart",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
