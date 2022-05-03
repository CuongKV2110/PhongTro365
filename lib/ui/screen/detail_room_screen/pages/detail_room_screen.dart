import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../../../resources/fontsizes.dart';

class DetailRoomScreen extends StatefulWidget {
  const DetailRoomScreen({Key? key}) : super(key: key);

  @override
  _DetailRoomScreenState createState() => _DetailRoomScreenState();
}

class _DetailRoomScreenState extends State<DetailRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: AppDimensions.d100w,
              height: AppDimensions.d100h,
              color: AppColors.white,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    width: AppDimensions.d100w,
                    height: AppDimensions.d30h,
                    child: Image.asset(
                      'images/room3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                    child: Expanded(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Icon(Ionicons.location_outline),
                              SizedBox(
                                width: 4,
                              ),
                              Text('Mễ Trì Hạ, Nam Từ Liêm, HN')
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Icon(Ionicons.card_outline),
                              SizedBox(
                                width: 4,
                              ),
                              Text('2.500.000 VNĐ/tháng')
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  children: const [
                                    Icon(Ionicons.expand_outline),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text('Diện tích 25m2')
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: const [
                                    Icon(Ionicons.ear_outline),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text('Không chung chủ')
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  children: const [
                                    Icon(Ionicons.call_outline),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text('0367031430')
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: const [
                                    Icon(Ionicons.time_outline),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text('3 ngày trước')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Các tiện ích",
                          style: TextStyle(
                              fontSize: AppFontSizes.fs16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: AppDimensions.d100w,
                          height: AppDimensions.d24h,
                          child: GridView(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'images/wifi.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text('Wifi')
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'images/toilet.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text('WC riêng')
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'images/time.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text('Tự do')
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'images/xemay.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text('Để xe')
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'images/bep.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text('Bếp')
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'images/tulanh.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text('Tủ lạnh')
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'images/maygiat.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text('Máy giặt')
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    'images/dieuhoa.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text('Điều hòa')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: AppDimensions.d100w,
                height: 60,
                color: AppColors.gray6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColors.gray6,
                          border: Border.all(width: 1, color: AppColors.black),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Ionicons.navigate_circle_outline),
                            SizedBox(width: 6),
                            Text('Location')
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColors.gray6,
                          border: Border.all(width: 1, color: AppColors.black),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Ionicons.call_outline),
                            SizedBox(width: 6),
                            Text('Call')
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColors.gray6,
                          border: Border.all(width: 1, color: AppColors.black),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Ionicons.arrow_redo_outline),
                            SizedBox(width: 6),
                            Text('Share')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
