import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/helpers/date_helper.dart';
import 'package:phongtro/models/result.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/ui/screen/newfeed_screen/bloc/newfeed_state.dart';
import 'package:phongtro/ui/screen/profile_screen/pages/view_profile.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../models/room.dart';
import '../../../../models/write.dart';
import '../../../../models/write_detail.dart';
import '../../../../resources/dimensions.dart';
import '../bloc/newfeed_bloc.dart';
import '../widgets/build_newfeed_bar.dart';
import '../widgets/button_widget.dart';
import '../widgets/info_widget.dart';

class NewFeedScreen extends StatefulWidget {
  const NewFeedScreen({Key? key}) : super(key: key);

  @override
  _NewFeedScreenState createState() => _NewFeedScreenState();
}

class _NewFeedScreenState extends State<NewFeedScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  NewFeedBloc bloc = NewFeedBloc();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
            const Duration(seconds: 2),
          );
          bloc.refreshData();
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: BlocProvider<NewFeedBloc>(
            create: (context) => bloc..getData(),
            child: BlocBuilder<NewFeedBloc, NewFeedState>(
              builder: (context, state) {
                if (state is NewFeedLoading) {
                  return _buildShimmer();
                }
                if (state is NewFeedLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        _buildContent(_currentIndex, state.result),
                      ],
                    ),
                  );
                }
                return const Center();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(int currentIndex, Result result) {
    return SizedBox(
      width: AppDimensions.d100w,
      height: AppDimensions.d100h - 140,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 46,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  _buildItem(0, "Phòng cho thuê"),
                  const SizedBox(
                    width: 26,
                  ),
                  _buildItem(1, "Tin tìm phòng"),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildOptions(_currentIndex, result)
          ],
        ),
      ),
    );
  }

  Widget _buildOptions(int index, Result result) {
    if (index == 0) {
      return _buildNewFeed(result.room);
    } else {
      return _buildWritePost(result.write);
    }
  }

  Widget _buildWritePost(List<WriteDetail> write) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: write.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoWidget(
              write[index].avt,
              write[index].username,
              write[index].write.timePost,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(write[index].write.content)
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            Divider(
              color: AppColors.gray,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }

  Widget _buildItem(int index, String text) {
    bool active = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        width: AppDimensions.d32w,
        height: 40,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.orange1,
              AppColors.orange2,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          color: active ? AppColors.yellowGao : AppColors.transparent,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: active ? FontWeight.bold : FontWeight.normal,
                color: active ? AppColors.black : AppColors.black),
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      width: AppDimensions.d100w,
      height: AppDimensions.d100h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: const [
                    SizedBox(height: 340),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNewFeed(List<Room> data) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: AppDimensions.d90w,
              height: AppDimensions.d50h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: AppColors.black50.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(data[index]),
                    const SizedBox(height: 10),
                    _buildImage(data[index]),
                    const SizedBox(height: 10),
                    _buildIcon(data[index]),
                    const SizedBox(height: 10),
                    _buildContentPost(data[index]),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }

  Widget _buildHeader(Room room) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) {
                  return ViewProfile(room);
                },
              ),
            );
          },
          child: InfoWidget(room.userAvatar, room.userName, room.timePost),
        ),
        const Spacer(),
        ButtonWidget(room.postID),
      ],
    );
  }

  Widget _buildImage(Room room) {
    return Expanded(
      child: GestureDetector(
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: room.imgUrl![0],
                    fit: BoxFit.fill,
                    width: AppDimensions.d50w,
                    height: AppDimensions.d40h,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: room.imgUrl![1],
                        fit: BoxFit.fill,
                        width: AppDimensions.d30w,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: room.imgUrl![2],
                        fit: BoxFit.fill,
                        width: AppDimensions.d30w,
                        height: 100,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(Room room) {
    return Row(
      children: [
        Text(
          'Chi phí: ' + room.cost + " VNĐ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
            fontSize: 13,
          ),
        ),
        const Spacer(),
        Text("Bình luận (" + room.comment!.length.toString() + ')'),
      ],
    );
  }

  Widget _buildContentPost(Room room) {
    return Text(
      room.content + room.status.toString(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: AppColors.black, fontSize: 13, height: 1.7),
    );
  }
}
