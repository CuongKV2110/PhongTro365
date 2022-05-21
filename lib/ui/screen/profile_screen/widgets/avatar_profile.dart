import 'package:flutter/material.dart';
import 'package:phongtro/models/account.dart';
import '../../../../resources/colors.dart';
import 'avatar_profile1.dart';

class AvatarProfile extends StatelessWidget {
  Account account;

  AvatarProfile(this.account);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarProfile1(account.avt),
        const SizedBox(
          height: 10,
        ),
        Text(
          account.displayName,
          style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          account.email,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
