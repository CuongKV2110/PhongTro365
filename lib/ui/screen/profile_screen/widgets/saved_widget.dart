import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../resources/colors.dart';
import '../../saved_screen/pages/saved_screen.dart';

class SavedWidget extends StatelessWidget {
  const SavedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const SavedScreen();
                },
              ),
            );
          },
          child: Icon(
            Ionicons.bookmarks_outline,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            primary: Colors.blue,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          'Saved Post',
          style: TextStyle(color: AppColors.black),
        )
      ],
    );
  }
}
