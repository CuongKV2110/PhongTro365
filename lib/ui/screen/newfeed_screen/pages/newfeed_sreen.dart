import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/ui/screen/detail_room_screen/pages/detail_room_screen.dart';

class NewFeedScreen extends StatefulWidget {
  const NewFeedScreen({Key? key}) : super(key: key);

  @override
  _NewFeedScreenState createState() => _NewFeedScreenState();
}

class _NewFeedScreenState extends State<NewFeedScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.gray8,
              AppColors.white,
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                _buildImage1(),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                _buildSearch(),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                _buildPost(),
              ],
            ),
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
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: Container(
        width: AppDimensions.d92w,
        height: AppDimensions.d10h,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
          child: TextField(
              decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: const TextStyle(
              color: AppColors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: AppColors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: AppColors.black,
                width: 1.0,
              ),
            ),
            labelStyle: const TextStyle(color: AppColors.black),
            alignLabelWithHint: true,
          )),
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
                  return const DetailRoomScreen();
                },
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            width: AppDimensions.d100w,
            decoration: BoxDecoration(
              color: AppColors.gray.withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
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
