import 'package:flutter/material.dart';
import '../../../../resources/colors.dart';

class BuildHomeBar extends StatelessWidget {
  const BuildHomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(19, 0, 29, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Tìm Phòng 365',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Xin chào, Cường',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
