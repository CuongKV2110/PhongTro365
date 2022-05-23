import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/providers/singleton.dart';

import '../../../../models/room.dart';
import '../../../../resources/colors.dart';

class InfoWidget extends StatelessWidget {
  Room room;

  InfoWidget(this.room);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: CachedNetworkImageProvider(room.userAvatar),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              room.userName,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              room.phone,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 9,
                letterSpacing: 1.6,
              ),
            )
          ],
        ),
      ],
    );
  }
}
