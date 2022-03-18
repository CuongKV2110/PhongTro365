import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/ui/screen/detail_screen.dart';
import 'package:phongtro/ui/screen/post_screen.dart';

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
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.gray,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return PostScreen();
              }),
            );
          },
          child: const Icon(
            Icons.add_outlined,
            color: AppColors.white,
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: CustomScrollView(
            slivers: [
              _buildImage1(),
              _buildSearch(),
              _buildImage2(),
              _buildPost(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage1() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      expandedHeight: AppDimensions.d20h,
      // collapsedHeight: 60,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground
        ],
        background: Container(
          width: AppDimensions.d100w,
          height: AppDimensions.d20h,
          child: Image.asset(
            'images/HN1.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: Container(
        width: AppDimensions.d92w,
        height: AppDimensions.d10h,
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
          child: Container(
            width: AppDimensions.d90w,
            height: AppDimensions.d10h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 0.5, color: AppColors.black)),
          ),
        ),
      ),
    );
  }

  Widget _buildImage2() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      primary: false,

      expandedHeight: AppDimensions.d20h,
      // collapsedHeight: 60,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.blurBackground
        ],
        background: Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
          child: Container(
            width: AppDimensions.d92w,
            height: AppDimensions.d20h,
            child: Image.asset(
              'images/HN.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPost() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const DetailScreen();
                },
              ),
            );
          },
          child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                              backgroundImage: AssetImage('images/avt1.jpg')),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.gray,
                                  AppColors.white,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: AppColors.black, width: 0.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.attach_money_outlined,
                                size: 16,
                              ),
                              Text('2.500.000 VND'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 140,
                          height: 30,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.gray,
                                  AppColors.white,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: AppColors.black, width: 0.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.people_outline,
                                size: 16,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text('Không chung chủ'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
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
                      padding: const EdgeInsets.fromLTRB(10, 4, 14, 16),
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
              )),
        );
      }),
    );
  }
}
