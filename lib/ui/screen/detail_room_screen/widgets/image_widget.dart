import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../home_screen/pages/home_screen.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: AppDimensions.d100w,
          height: AppDimensions.d30h,
          child: Image.asset(
            'images/room3.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
                color: AppColors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return HomeScreen();
                    },
                  ),
                );
              }),
        )
      ],
    );
  }
}
