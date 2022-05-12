import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/fontsizes.dart';

class PeopleWidget extends StatefulWidget {
  TextEditingController peopeController;

  PeopleWidget(this.peopeController);

  @override
  _PeopleWidgetState createState() => _PeopleWidgetState();
}

class _PeopleWidgetState extends State<PeopleWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sức chứa',
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
                  controller: widget.peopeController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(child: Text('Người/Phòng'))
            ],
          ),
        ],
      ),
    );
  }
}
