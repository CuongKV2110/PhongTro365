import 'package:flutter/material.dart';
import 'package:phongtro/models/extension.dart';

import '../../../../resources/colors.dart';

class ExtensionItemWidget extends StatefulWidget {
  Extension extension;

  ExtensionItemWidget(this.extension);

  @override
  _ExtensionItemWidgetState createState() => _ExtensionItemWidgetState();
}

class _ExtensionItemWidgetState extends State<ExtensionItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          widget.extension.icon,
          width: 40,
          height: 40,
          color: AppColors.black,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          widget.extension.name,
          style: const TextStyle(
            color: AppColors.black,
          ),
        )
      ],
    );
  }
}
