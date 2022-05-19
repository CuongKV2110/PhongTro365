import 'package:flutter/material.dart';

import '../../../../models/extension.dart';
import '../../../../models/room.dart';
import '../../../../resources/colors.dart';

class RoomExtension extends StatefulWidget {
  Room room;

  RoomExtension(this.room);

  @override
  _RoomExtensionState createState() => _RoomExtensionState();
}

class _RoomExtensionState extends State<RoomExtension> {
  final List<Extension> lisExtension = [];

  @override
  void initState() {
    if (widget.room.wifi == true) {
      lisExtension.add(
        Extension(
          icon: 'images/wifi.png',
          name: 'wifi',
          isPress: false,
        ),
      );
    }
    if (widget.room.wc == true) {
      lisExtension.add(
        Extension(
          icon: 'images/toilet.png',
          name: 'WC riêng',
          isPress: false,
        ),
      );
    }

    if (widget.room.time == true) {
      lisExtension.add(
        Extension(
          icon: 'images/time.png',
          name: 'Tự do',
          isPress: false,
        ),
      );
    }
    if (widget.room.vehicle == true) {
      lisExtension.add(
        Extension(
          icon: 'images/xemay.png',
          name: 'Để xe',
          isPress: false,
        ),
      );
    }
    if (widget.room.kitchen == true) {
      lisExtension.add(
        Extension(
          icon: 'images/bep.png',
          name: 'Bếp',
          isPress: false,
        ),
      );
    }
    if (widget.room.fridge == true) {
      lisExtension.add(
        Extension(
          icon: 'images/tulanh.png',
          name: 'Tủ lạnh',
          isPress: false,
        ),
      );
    }
    if (widget.room.washing == true) {
      lisExtension.add(
        Extension(
          icon: 'images/maygiat.png',
          name: 'Máy giặt',
          isPress: false,
        ),
      );
    }
    if (widget.room.conditioning == true) {
      lisExtension.add(
        Extension(
          icon: 'images/dieuhoa.png',
          name: 'Điều hòa',
          isPress: false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: lisExtension.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset(
              lisExtension[index].icon,
              width: 40,
              height: 40,
              color: AppColors.black,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              lisExtension[index].name,
              style: const TextStyle(
                color: AppColors.black,
              ),
            )
          ],
        );
      },
    );
  }
}
