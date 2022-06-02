import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';

class DotCenter extends StatelessWidget {
  const DotCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.gray,
      ),
    );
  }
}
