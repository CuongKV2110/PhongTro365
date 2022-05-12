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
          child: Icon(
            Ionicons.information_circle_outline,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            primary: Colors.blue,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          'About',
          style: TextStyle(color: AppColors.black),
        )
      ],
    );
  }
}
