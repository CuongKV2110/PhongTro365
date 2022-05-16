import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../resources/colors.dart';

class BuildMediaWidget extends StatelessWidget {
  const BuildMediaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDivider(),
        SizedBox(
          height: 20,
        ),
        _buildMedia(),
      ],
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Expanded(
          child: Divider(
            color: AppColors.black50,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Hoặc đăng nhập với",
          style: TextStyle(color: AppColors.black, fontSize: 16),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Divider(
            color: AppColors.black50,
          ),
        ),
      ]),
    );
  }

  Widget _buildMedia() {
    return Row(
      children: [
        Spacer(),
        Container(
          width: 45,
          height: 45,
          child: Icon(
            Icons.facebook_outlined,
            color: AppColors.white,
          ),
          decoration: BoxDecoration(
            color: AppColors.blue1,
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 45,
          height: 45,
          child: Icon(
            Ionicons.logo_google,
            color: AppColors.white,
          ),
          decoration: BoxDecoration(
            color: AppColors.red2,
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 45,
          height: 45,
          child: Icon(
            Ionicons.logo_twitter,
            color: AppColors.white,
          ),
          decoration: BoxDecoration(
            color: AppColors.blue1,
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        Spacer()
      ],
    );
  }
}
