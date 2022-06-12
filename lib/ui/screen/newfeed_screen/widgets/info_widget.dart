import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/helpers/date_helper.dart';
import '../../../../resources/colors.dart';

class InfoWidget extends StatelessWidget {
  String avt;
  String userName;
  int time;

  InfoWidget(this.avt, this.userName, this.time);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: CachedNetworkImageProvider(avt),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
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
              DateHelper.getTimeAgo(time),
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
