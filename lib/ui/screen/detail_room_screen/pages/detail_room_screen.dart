import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../models/extension.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../../../resources/fontsizes.dart';

class DetailRoomScreen extends StatefulWidget {
  const DetailRoomScreen({Key? key}) : super(key: key);

  @override
  _DetailRoomScreenState createState() => _DetailRoomScreenState();
}

class _DetailRoomScreenState extends State<DetailRoomScreen> {
  final List<Extension> lisExtension = [];

  @override
  void initState() {
    lisExtension.add(
      Extension(
        icon: 'images/wifi.png',
        name: 'wifi',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/toilet.png',
        name: 'WC riêng',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/time.png',
        name: 'Giờ giấc',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/xemay.png',
        name: 'Để xe',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/bep.png',
        name: 'Bếp',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/tulanh.png',
        name: 'Tủ lạnh',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/maygiat.png',
        name: 'Máy giặt',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/dieuhoa.png',
        name: 'Điều hòa',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/dieuhoa.png',
        name: 'Điều hòa',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/dieuhoa.png',
        name: 'Điều hòa',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/dieuhoa.png',
        name: 'Điều hòa',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/dieuhoa.png',
        name: 'Điều hòa',
        isPress: false,
      ),
    );
    lisExtension.add(
      Extension(
        icon: 'images/dieuhoa.png',
        name: 'Điều hòa',
        isPress: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                      height: 16,
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
                      height: 16,
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
                      height: 16,
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
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
