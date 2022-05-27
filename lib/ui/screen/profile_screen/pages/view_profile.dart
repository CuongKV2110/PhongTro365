import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/providers/singleton.dart';
import 'package:phongtro/ui/screen/profile_screen/widgets/about_widget.dart';

import '../../../../models/room.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../widgets/background_img.dart';
import '../widgets/build_appbar.dart';
import '../widgets/build_container.dart';

class ViewProfile extends StatelessWidget {
  late Room room;

  ViewProfile(this.room);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const BuildContainer(),
                  Positioned(
                    top: 0,
                    child: BackgroundImage(),
                  ),
                  Positioned(
                    top: 20,
                    child: SizedBox(
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
                              child: const Icon(
                                Icons.arrow_back,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                              child: Column(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                                room.userAvatar),
                                      ),
                                    ),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          AppColors.orange1,
                                          AppColors.orange2,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    room.userName,
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
                                    room.phone,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
