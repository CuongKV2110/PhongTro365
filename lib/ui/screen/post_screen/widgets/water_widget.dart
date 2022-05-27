import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../../../resources/fontsizes.dart';

class WaterWidget extends StatefulWidget {
  TextEditingController waterController;

  WaterWidget(this.waterController);

  @override
  _WaterWidgetState createState() => _WaterWidgetState();
}

class _WaterWidgetState extends State<WaterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tiền nước',
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
                controller: widget.waterController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('VNĐ/Người'),
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
