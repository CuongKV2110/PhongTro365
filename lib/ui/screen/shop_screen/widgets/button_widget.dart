import 'package:flutter/material.dart';
import 'package:phongtro/ui/screen/detail_room_screen/pages/detail_room_screen.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimensions.d20w,
      height: 24,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return DetailRoomScreen();
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.orange1,
                AppColors.orange2,
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            width: AppDimensions.d20w,
            height: 24,
            alignment: Alignment.center,
            child: const Text(
              'Chi tiết',
              style: TextStyle(fontSize: 11),
            ),
          ),
        ),
      ),
    );
  }
}
