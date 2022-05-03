import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../resources/dimensions.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Image.asset(
        'images/HN1.jpg',
        height: AppDimensions.d26h,
        width: AppDimensions.d100w,
        fit: BoxFit.fill,
      ),
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(24),
        bottomLeft: Radius.circular(24),
      ),
    );
  }
}
