import 'package:flutter/material.dart';
import 'package:phongtro/models/account.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import 'avatar_profile.dart';
import 'background_img.dart';
import 'build_appbar.dart';
import 'build_container.dart';
import 'build_info.dart';

class BuildProfile extends StatefulWidget {
  Account account;

  BuildProfile(this.account);

  @override
  _BuildProfileState createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const BuildContainer(),
        Positioned(
          top: 0,
          child: BackgroundImage(),
        ),
        const Positioned(
          top: 20,
          child: BuildAppBar(),
        ),
        Positioned(
          top: 100,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: AppDimensions.d80w,
                    height: AppDimensions.d26h,
                    color: Colors.transparent,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: AppDimensions.d80w,
                      height: AppDimensions.d20h,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: AvatarProfile(widget.account),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              /*const BuildInfo(),*/
            ],
          ),
        ),
      ],
    );
  }
}
