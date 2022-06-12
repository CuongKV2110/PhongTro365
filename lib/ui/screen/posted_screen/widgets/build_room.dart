import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/helpers/date_helper.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/ui/screen/home_screen/pages/home_screen.dart';
import 'package:phongtro/ui/screen/posted_screen/widgets/room_image.dart';
import 'package:phongtro/ui/screen/posted_screen/widgets/room_info.dart';

import '../../../../models/room.dart';
import '../../../../resources/dimensions.dart';
import 'room_extension.dart';

class BuildRoom extends StatefulWidget {
  Room room;
  int back;

  BuildRoom(this.room, this.back);

  @override
  _BuildRoomState createState() => _BuildRoomState();
}

class _BuildRoomState extends State<BuildRoom> {
  int _currentImg = 0;
  bool isPressed = false;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        builder: (BuildContext context) => const HomeScreen()),
                    (Route<dynamic> route) => false);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ListView(
          physics: const BouncingScrollPhysics(),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Nội dung',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.room.content),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Ionicons.time_outline,
                        size: 20,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Đã đăng vào: ' +
                            DateHelper.getTimeAgo(widget.room.timePost),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Thông tin chi tiết',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RoomInfo(widget.room),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Các chi phí khác',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Ionicons.water_outline,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text("Tiền nước: "),
                      Text(widget.room.water.toString()),
                      const Text(" VNĐ/m3"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Ionicons.bulb_outline,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text("Tiền điện: "),
                      Text(widget.room.electricity.toString()),
                      const Text(" VNĐ/số"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Ionicons.globe_outline,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text("Tiền mạng: "),
                      Text(widget.room.internet.toString()),
                      const Text(" VNĐ/người"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Các tiện ích của phòng',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoomExtension(widget.room),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
