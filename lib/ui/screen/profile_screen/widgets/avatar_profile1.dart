import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';

class AvatarProfile1 extends StatelessWidget {
  const AvatarProfile1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Padding(
        padding: EdgeInsets.all(3),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('images/avt.jpg'),
        ),
      ),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.orange1,
            AppColors.orange2,
          ],
        ),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
