import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/helpers/date_helper.dart';
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              DateHelper.getTimeAgo(room.timePost),
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 13,
                letterSpacing: 0.8,
              ),
            )
          ],
        ),
      ],
    );
  }
}
