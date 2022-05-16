import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';

class SlideDots extends StatelessWidget {
  bool isActive;

  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 12,
        width: 12,
        child: Padding(
          padding: EdgeInsets.all(1.6),
          child: Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppColors.white,
                width: 1.6,
              ),
              color: AppColors.orange1,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: AppColors.orange1,
          borderRadius: BorderRadius.circular(6),
        ),
      );
    } else {
      return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 8,
        width: 8,
        decoration: const BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      );
    }
  }
}
