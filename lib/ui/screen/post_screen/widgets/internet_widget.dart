import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../../../resources/fontsizes.dart';

class InternetWidget extends StatefulWidget {
  TextEditingController internetController;

  InternetWidget(this.internetController);


  @override
  _InternetWidgetState createState() => _InternetWidgetState();
}

class _InternetWidgetState extends State<InternetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tiền mạng',
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
                controller: widget.internetController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text('VND/Người'),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ],
    );
  }
}
