import 'package:flutter/material.dart';
import 'package:phongtro/models/menu_item.dart';

import '../../../../resources/colors.dart';

class MenuWidget extends StatelessWidget {
  MenuItem item;

  MenuWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              item.icon,
              color: AppColors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              item.name,
              style: const TextStyle(color: AppColors.white),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
