import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';

class NewFeedScreen extends StatefulWidget {
  const NewFeedScreen({Key? key}) : super(key: key);

  @override
  _NewFeedScreenState createState() => _NewFeedScreenState();
}

class _NewFeedScreenState extends State<NewFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                              backgroundImage: AssetImage('images/2.png')),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Kieu Van Cuong',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.favorite_outline),
                          SizedBox(
                            width: 8,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Có phòng cho thuê tại Mễ Trì Hạ Nam Từ Liem, giá 2tr4/tháng',
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: AppDimensions.d90w,
                    height: AppDimensions.d20h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'images/code1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 4, 14, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: const [
                            SizedBox(width: 6,),
                            Text('112 likes'),
                          ],),
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
                            bottom: BorderSide(
                                width: 0.5,
                                color: AppColors.gray
                            )
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: AppDimensions.d90w,
                    height: 6,
                    color: AppColors.gray,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
