import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';

class ShareRoomScreen extends StatefulWidget {
  const ShareRoomScreen({Key? key}) : super(key: key);

  @override
  _ShareRoomScreenState createState() => _ShareRoomScreenState();
}

class _ShareRoomScreenState extends State<ShareRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Share Rooms',
            style: TextStyle(color: AppColors.black),
          ),
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 10, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: AppDimensions.d20h,
                            height: AppDimensions.d24h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: AppColors.black, width: 2),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'images/code1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 4,
                            left: 4,
                            child: Image.asset(
                              'images/new.png',
                              width: 50,
                              height: 50,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kieu Van Cuong',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                    fontSize: AppFontSizes.fs16),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.person_search_outlined,
                                    color: AppColors.gray,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text('1 người')
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.attach_money_outlined,
                                    color: AppColors.gray,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text('1.500.000 VNĐ')
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.gray,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text('Mỹ Đình, Hà Nội')
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.colorFAC524,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: AppColors.black,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'View Details',
                                style: TextStyle(
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: AppDimensions.d90w,
                    height: 20,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.gray5,
                          width: 1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
