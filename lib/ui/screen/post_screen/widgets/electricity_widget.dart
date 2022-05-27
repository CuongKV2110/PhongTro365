import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../../../resources/fontsizes.dart';

class ElectricityWidget extends StatefulWidget {
  TextEditingController electricityController;

  ElectricityWidget(this.electricityController);

  @override
  _ElectricityWidgetState createState() => _ElectricityWidgetState();
}

class _ElectricityWidgetState extends State<ElectricityWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tiền điện',
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
                controller: widget.electricityController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('VNĐ/Số'),
            const SizedBox(
              width: 20,
            )
            // Checkbox(value: value, onChanged: onChanged)
          ],
        ),
      ],
    );
  }
}
