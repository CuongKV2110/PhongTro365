import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/ui/screen/posted_screen/widgets/room_image.dart';
import 'package:phongtro/ui/screen/posted_screen/widgets/room_info.dart';

import '../../../../models/room.dart';
import 'room_extension.dart';

class BuildRoom extends StatelessWidget {
  Room room;

  BuildRoom(this.room);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          RoomImage(room.imgUrl),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Nội dung',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(room.content),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Thông tin chi tiết',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                RoomInfo(room),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Các chi phí khác',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Ionicons.water_outline,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text("Tiền nước: "),
                    Text(room.water),
                    Text(" VNĐ/người"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Ionicons.bulb_outline,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text("Tiền điện: "),
                    Text(room.electricity),
                    Text(" VNĐ/số"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Ionicons.globe_outline,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text("Tiền mạng: "),
                    Text(room.internet),
                    Text(" VNĐ/người"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Các tiện ích của phòng',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RoomExtension(room),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
