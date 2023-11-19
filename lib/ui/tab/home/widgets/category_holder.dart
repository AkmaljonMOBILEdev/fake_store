import 'package:fake_store/utils/colors.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryHolder extends StatelessWidget {
  const CategoryHolder({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        color: isSelected ? AppColors.c0D6EFD : Colors.white,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: editW(20), vertical: editH(12)),
          child: Center(
            child: Text(
              title[0].toUpperCase() + title.substring(1),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: isSelected ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
