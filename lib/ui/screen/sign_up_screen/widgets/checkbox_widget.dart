import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.all(AppColors.white),
          checkColor: AppColors.black,
          activeColor: AppColors.white,
          value: value,
          onChanged: (bool? value) {
            setState(() {
              this.value = value!;
            });
          },
        ),
        const Text(
          'I accept terms  & conditions and privacy policy',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
