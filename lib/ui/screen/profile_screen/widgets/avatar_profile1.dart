import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';

class AvatarProfile1 extends StatelessWidget {
  String avt_url;

  AvatarProfile1(this.avt_url);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(3),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: CachedNetworkImageProvider(avt_url),
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
