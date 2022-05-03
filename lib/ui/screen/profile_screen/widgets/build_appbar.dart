import 'package:flutter/material.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.d100w,
      height: 30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              ),
            ),
            Spacer(),
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                /*Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const EditScreen();
                    },
                  ),
                );*/
              },
              child: Icon(
                Icons.edit_outlined,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
