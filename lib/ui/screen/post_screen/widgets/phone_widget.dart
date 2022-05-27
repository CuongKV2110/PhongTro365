import 'package:flutter/material.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/fontsizes.dart';

class PhoneWidget extends StatefulWidget {
  TextEditingController phoneController;

  PhoneWidget(this.phoneController, {Key? key}) : super(key: key);

  @override
  _PhoneWidgetState createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Số điện thoại liên hệ',
          style: TextStyle(
              fontSize: AppFontSizes.fs12,
              color: AppColors.black,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget.phoneController,
          textAlign: TextAlign.start,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
