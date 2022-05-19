import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../models/room.dart';

class RoomInfo extends StatelessWidget {
  Room room;

  RoomInfo(this.room);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Icon(
              Ionicons.location_outline,
              size: 20,
            ),
            const SizedBox(
              width: 4,
            ),
            Text('Địa chỉ: '),
            const SizedBox(
              width: 4,
            ),
            Text(room.location)
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const Icon(
              Ionicons.card_outline,
              size: 20,
            ),
            const SizedBox(
              width: 4,
            ),
            Text('Giá phòng: '),
            const SizedBox(
              width: 4,
            ),
            Text(room.cost),
            Text(' VNĐ'),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(
                    Ionicons.expand_outline,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('Diện tích: '),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(room.acreage),
                  Text(' m2'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Icon(
                    Ionicons.ear_outline,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(room.owner)
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(
                    Ionicons.call_outline,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(room.phone)
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const Icon(
                    Ionicons.storefront_outline,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(room.wc == true ? 'Phòng khép kín' : "Không khép kín"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
