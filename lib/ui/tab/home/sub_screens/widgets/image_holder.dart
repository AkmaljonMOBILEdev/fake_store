import 'package:fake_store/utils/icons.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailedImageHolder extends StatelessWidget {
  const DetailedImageHolder({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imagePath,
          width: editW(200),
          height: editH(200),
        ),
        SvgPicture.asset(AppIcons.belowLine)
      ],
    );
  }
}
