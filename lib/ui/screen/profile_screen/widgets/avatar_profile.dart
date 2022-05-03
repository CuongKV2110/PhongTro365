import 'package:flutter/material.dart';
import '../../../../resources/colors.dart';
import 'avatar_profile1.dart';

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarProfile1(),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Kieu Van Cuong',
          style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '@cuongkv.it@gmail.com',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
