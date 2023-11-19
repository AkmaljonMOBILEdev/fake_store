import 'package:flutter/material.dart';

import '../../../utils/size_extensions.dart';

class AdminDivider extends StatelessWidget {
  const AdminDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: editW(8)),
      child: Divider(
        height: editW(4),
        thickness: editH(1.5),
      ),
    );
  }
}
