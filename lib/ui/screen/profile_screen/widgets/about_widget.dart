import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../resources/colors.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Icon(
            Ionicons.information_circle_outline,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            primary: AppColors.yellow1,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        const Text(
          'Thông tin',
          style: TextStyle(color: AppColors.black),
        )
      ],
    );
  }
}
