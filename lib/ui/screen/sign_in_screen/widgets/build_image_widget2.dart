import 'package:flutter/cupertino.dart';

import '../../../../resources/dimensions.dart';

class BuildImageWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.elliptical(200, 150),
            bottomLeft: Radius.elliptical(40, 40)),
        child: Image.asset(
          'images/2.png',
          width: AppDimensions.d100w,
          height: AppDimensions.d30h,
        ),
      ),
    );
  }
}
