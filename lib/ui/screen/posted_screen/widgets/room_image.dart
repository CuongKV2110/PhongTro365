import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../home_screen/pages/home_screen.dart';

class RoomImage extends StatelessWidget {
  String img_url;
  int back;

  RoomImage(this.img_url, this.back);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: AppDimensions.d100w,
          height: AppDimensions.d36h,
          child: CachedNetworkImage(
            imageUrl: img_url,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: AppColors.white,
            ),
            onPressed: () {
              back == 0
                  ? Navigator.of(context).pop()
                  : Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
            },
          ),
        )
      ],
    );
  }
}
