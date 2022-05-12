import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../resources/colors.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(
            Ionicons.language_outline,
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
          'Languague',
          style: TextStyle(color: AppColors.black),
        )
      ],
    );
  }
}
