import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../../../resources/fontsizes.dart';

class CostWidget extends StatefulWidget {
  TextEditingController costController;

  CostWidget(this.costController);

  @override
  _CostWidgetState createState() => _CostWidgetState();
}

class _CostWidgetState extends State<CostWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Giá phòng',
          style: TextStyle(
              fontSize: AppFontSizes.fs12,
              color: AppColors.black,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: AppDimensions.d40w,
              height: 30,
              child: TextField(
                controller: widget.costController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('VNĐ/Tháng')
          ],
        ),
      ],
    );
  }
}
