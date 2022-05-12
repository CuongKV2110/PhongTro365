import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../../detail_room_screen/pages/detail_room_screen.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const DetailRoomScreen();
                },
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
            width: AppDimensions.d100w,
            decoration: BoxDecoration(
              color: AppColors.gray.withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.gray,
                  AppColors.black,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                              backgroundImage: AssetImage('images/avt.jpg')),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Kieu Van Cuong',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: const [
                                  Text('2h ago'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.public_sharp,
                                    color: AppColors.gray8,
                                    size: 16,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Ha Noi',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 4,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Có phòng đầy đủ đồ đạc, cần cho thuê tại Mễ Trì Hạ Nam Từ Liêm, giá 2tr4/tháng. ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: AppDimensions.d92w,
                        height: AppDimensions.d26h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'images/room4.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 4, 10, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 6,
                              ),
                              Text('112 likes'),
                            ],
                          ),
                          Row(
                            children: const [
                              Text('25 Comments'),
                              SizedBox(
                                width: 6,
                              ),
                              Text('12 Shares')
                            ],
                          )
                        ],
                      ),
                    ),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 0.5, color: AppColors.gray))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.thumb_up_outlined),
                            SizedBox(
                              width: 6,
                            ),
                            Text('Like')
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.chat_outlined),
                            SizedBox(
                              width: 6,
                            ),
                            Text('Comment')
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.share_outlined),
                            SizedBox(
                              width: 6,
                            ),
                            Text('Share')
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
