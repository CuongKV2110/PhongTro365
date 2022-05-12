import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/fontsizes.dart';

class AcreageWidget extends StatefulWidget {
  TextEditingController acreageController;

  AcreageWidget(this.acreageController);

  @override
  _AcreageWidgetState createState() => _AcreageWidgetState();
}

class _AcreageWidgetState extends State<AcreageWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Diện tích',
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
              Expanded(
                child: TextField(
                  controller: widget.acreageController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(child: Text('m2'))
            ],
          ),
        ],
      ),
    );
  }
}
