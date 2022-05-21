import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../resources/colors.dart';

class BuildNewFeedBar extends StatelessWidget {
  const BuildNewFeedBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: TextField(
                style: TextStyle(color: AppColors.black),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.black),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: AppColors.black50,
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.black50,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(Ionicons.options_outline,
                  color: AppColors.orange1),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
