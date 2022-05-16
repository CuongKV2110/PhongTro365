import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../resources/colors.dart';

class MyPostWidget extends StatelessWidget {
  const MyPostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(
            Ionicons.create_outline,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            primary: AppColors.yellow1,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          'Đã đăng',
          style: TextStyle(color: AppColors.black),
        )
      ],
    );
  }
}
