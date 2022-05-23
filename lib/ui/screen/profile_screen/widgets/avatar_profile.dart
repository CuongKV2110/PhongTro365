import 'package:flutter/material.dart';
import 'package:phongtro/models/account.dart';
import '../../../../resources/colors.dart';
import 'avatar_profile1.dart';

class AvatarProfile extends StatefulWidget {
  Account account;
  AvatarProfile(this.account);

  @override
  _AvatarProfileState createState() => _AvatarProfileState();
}

class _AvatarProfileState extends State<AvatarProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AvatarProfile1(widget.account.avt),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.account.displayName,
          style: const TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.account.email,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
