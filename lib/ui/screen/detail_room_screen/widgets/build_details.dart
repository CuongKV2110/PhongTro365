import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../models/room.dart';
import '../../../../resources/colors.dart';
import '../../posted_screen/widgets/room_extension.dart';
import '../../posted_screen/widgets/room_info.dart';

class BuildDetails extends StatelessWidget {
  Room room;

  BuildDetails(this.room);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.black50.withOpacity(0.2),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(14, 4, 14, 4),
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
                    fontSize: 16,
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
                  'Thông tin',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
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
                    fontSize: 16,
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
                    const Text("Tiền nước: "),
                    Text(room.water.toString()),
                    const Text(" VNĐ/m3"),
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
                    const Text("Tiền điện: "),
                    Text(room.electricity.toString()),
                    const Text(" VNĐ/số"),
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
                    const Text("Tiền mạng: "),
                    Text(room.internet.toString()),
                    const Text(" VNĐ/người"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Các tiện ích của phòng',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
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
        ),
      ),
    );
  }
}
