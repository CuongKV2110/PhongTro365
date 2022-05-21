import 'package:flutter/material.dart';
import 'package:phongtro/providers/singleton.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';

class BuildInfo extends StatelessWidget {
  const BuildInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.d100w,
      child: Column(
        children: [
          Text('SDT: 0367031430'),
          Text('Me Tri Ha, Nam Tu Liem'),
        ],
      ),
    );
  }
}
