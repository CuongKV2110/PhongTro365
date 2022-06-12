import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../models/room.dart';
import '../../../../resources/colors.dart';

class ShareItem extends StatelessWidget {
  Room room;

  ShareItem(this.room);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.gray,
            AppColors.gray8,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: AppColors.black50,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CachedNetworkImage(
                        imageUrl: room.imgUrl![0],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'images/money3.png',
                        width: 24,
                        height: 24,
                        color: AppColors.white,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        room.cost.toString() + ' VNĐ',
                        style: const TextStyle(
                          color: AppColors.orange1,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        room.type,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Ionicons.bookmark_outline,
                          color: AppColors.white,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
