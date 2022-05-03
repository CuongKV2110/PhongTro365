import 'package:flutter/material.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';

class BuildInfo extends StatelessWidget {
  const BuildInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.d100w,
      child: Row(
        children: [
          const Spacer(),
          Column(
            children: const [
              Text(
                '30.2K',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Following',
                style: TextStyle(color: AppColors.white, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(
            width: 40,
          ),
          Container(
            width: 1,
            height: 30,
            color: AppColors.white,
          ),
          const SizedBox(
            width: 40,
          ),
          Column(
            children: const [
              Text(
                '3',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Today Event',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
