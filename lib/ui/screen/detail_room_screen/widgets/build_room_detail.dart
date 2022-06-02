import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/models/comment.dart';
import 'package:phongtro/providers/singleton.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/ui/screen/detail_room_screen/bloc/detail_event.dart';
import 'package:phongtro/ui/screen/detail_room_screen/widgets/build_comments.dart';
import 'package:phongtro/ui/screen/detail_room_screen/widgets/build_details.dart';
import 'package:phongtro/ui/screen/home_screen/pages/home_screen.dart';
import '../../../../models/room.dart';
import '../../../../resources/dimensions.dart';
import '../bloc/comment_bloc/comment_bloc.dart';
import '../bloc/detail_bloc.dart';

class BuildRoomDetail extends StatefulWidget {
  DetailBloc bloc;
  Room room;
  int back;

  BuildRoomDetail(this.bloc, this.room, this.back);

  @override
  _BuildRoomDetailState createState() => _BuildRoomDetailState();
}

class _BuildRoomDetailState extends State<BuildRoomDetail> {
  int _currentImg = 0;
  bool isPressed = false;
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;
  bool isSwitched = false;
  bool isComment = false;
  TextEditingController commentController = TextEditingController();

  CommentBloc commentBloc = CommentBloc();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Chi tiết phòng',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.black,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              widget.back == 0
                  ? Navigator.of(context).pop()
                  : Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const HomeScreen()),
                      (Route<dynamic> route) => false);
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      _buildImage(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildSlider(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildBody(),
                    ],
                  ),
                ],
              ),
            ),
            _currentIndex == 1 ? _buildComment() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildComment() {
    return Positioned(
        bottom: 0,
        left: 0,
        child: Container(
          width: AppDimensions.d100w,
          height: 50,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: AppColors.gray),
            ),
            color: AppColors.gray,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Ionicons.happy_outline,
                  color: AppColors.black,
                ),
                const SizedBox(
                  width: 23,
                ),
                SizedBox(
                  width: 140,
                  height: 60,
                  child: Center(
                    child: TextField(
                      controller: commentController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Viết bình luận...'),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.attach_file,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(
                  width: 22,
                ),
                GestureDetector(
                  onTap: () {
                    Comment comment = Comment(
                      commentId: '',
                      postId: widget.room.postID,
                      userId: Singleton.instance.account.userID,
                      content: commentController.text.trim(),
                      time: DateTime.now().millisecondsSinceEpoch ~/ 1000,
                    );
                    widget.bloc.add(AddComment(comment));

                    setState(() {});
                  },
                  child: const Icon(
                    Ionicons.paper_plane_outline,
                    color: AppColors.white,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildBody() {
    return SizedBox(
      width: AppDimensions.d100w,
      height: AppDimensions.d50h,
      child: Column(
        children: [
          SizedBox(
            height: 46,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                _buildItem(0, Ionicons.newspaper_outline, "Chi tiết phòng"),
                const SizedBox(
                  width: 26,
                ),
                _buildItem(
                    1, Ionicons.chatbubble_ellipses_outline, "Bình luận"),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildContent(_currentIndex)
        ],
      ),
    );
  }

  Widget _buildItem(int index, IconData icon, String text) {
    bool active = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        width: AppDimensions.d40w,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: active ? AppColors.yellowGao : AppColors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: active ? AppColors.black : AppColors.black,
            ),
            const SizedBox(
              width: 9,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 14,
                  color: active ? AppColors.black : AppColors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(int index) {
    if (index == 0) {
      return Expanded(
        child: BuildDetails(widget.room),
      );
    } else {
      return Expanded(
        child: BuildComments(widget.room),
      );
    }
  }

  Widget _buildSlider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ...Iterable<int>.generate(widget.room.imgUrl!.length).map(
          (int pageIndex) {
            return GestureDetector(
              onTap: () {
                print('IN');
                print(pageIndex.toString());
                print(_currentImg.toString());
                _controller.animateToPage(pageIndex);
                setState(() {
                  _currentImg = pageIndex;
                });
                print(pageIndex.toString());
                print(_currentImg.toString());
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                height: 10,
                width: 20,
                child: Container(
                  width: 16,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: pageIndex == _currentImg
                        ? AppColors.orange2
                        : AppColors.gray,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Container(
      child: CarouselSlider.builder(
        carouselController: _controller,
        itemCount: widget.room.imgUrl!.length,
        options: CarouselOptions(
            enlargeCenterPage: true,
            height: AppDimensions.d50h,
            autoPlay: false,
            reverse: false,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              setState(() {
                _currentImg = index;
              });
            }),
        itemBuilder: (context, index, id) {
          var img_url = widget.room.imgUrl![index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: img_url,
              width: AppDimensions.d90w,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
