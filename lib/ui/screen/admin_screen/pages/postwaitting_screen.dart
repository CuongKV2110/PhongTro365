import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/ui/screen/admin_screen/pages/watting_detail_screen.dart';
import 'package:phongtro/ui/screen/admin_screen/widget/shimer_widget.dart';
import 'package:phongtro/ui/screen/newfeed_screen/bloc/newfeed_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../helpers/date_helper.dart';
import '../../../../models/room.dart';
import '../../../../models/write_detail.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/fontsizes.dart';
import '../../detail_room_screen/pages/detail_room_screen.dart';
import '../../newfeed_screen/bloc/newfeed_state.dart';

class PostWattingScreen extends StatefulWidget {
  const PostWattingScreen({Key? key}) : super(key: key);

  @override
  _PostWattingScreenState createState() => _PostWattingScreenState();
}

class _PostWattingScreenState extends State<PostWattingScreen> {
  NewFeedBloc wattingBloc = NewFeedBloc();

  @override
  void initState() {
    wattingBloc.getWatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
            const Duration(seconds: 2),
          );
          wattingBloc.refreshWatting();
        },
        child: Scaffold(
          body: BlocProvider<NewFeedBloc>(
            create: (context) => wattingBloc,
            child: BlocBuilder<NewFeedBloc, NewFeedState>(
              builder: (context, state) {
                if (state is NewFeedLoading) {
                  return const ShimmerWidget();
                }
                if (state is NewFeedLoaded) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
                    child: SizedBox(
                      width: AppDimensions.d100w,
                      height: AppDimensions.d100h,
                      child: ListView(
                        children: [
                          const Text(
                            'B??i vi???t cho thu?? ph??ng',
                            style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _buildWattingPost(state.result.room),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: AppColors.gray,
                          ),
                          const Text(
                            'B??i vi???t t??m ph??ng',
                            style: const TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _buildWattingWrite(state.result.write),
                        ],
                      ),
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

  Widget _buildWattingWrite(List<WriteDetail> list) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: CachedNetworkImageProvider(list[index].avt),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[index].username,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      DateHelper.getTimeAgo(list[index].write.timePost),
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 13,
                        letterSpacing: 0.8,
                      ),
                    )
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                /*Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) {
                      return WattingDetailScreen(
                          back: 0, postId: list[index].write.writeId);
                    },
                  ),
                );*/
              },
              child: Text(list[index].write.content),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 24,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32.0),
                                ),
                              ),
                              title: const Text(
                                "X??c nh???n duy???t b??i vi???t",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              content:
                                  const Text("B???n mu???n duy???t b??i vi???t n??y ?"),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    "Duy???t",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    wattingBloc
                                        .showWrite(list[index].write.writeId);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    "Tho??t",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.orange1,
                              AppColors.orange2,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          height: 24,
                          alignment: Alignment.center,
                          child: const Text(
                            'Duy???t b??i vi???t',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 24,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32.0),
                                ),
                              ),
                              title: const Text(
                                "X??c nh???n x??a b??i",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              content:
                                  const Text("B???n mu???n x??a b??i vi???t n??y ?"),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    "X??a",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    wattingBloc
                                        .deletePost1(list[index].write.writeId);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    "Tho??t",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.orange1,
                              AppColors.orange2,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          height: 24,
                          alignment: Alignment.center,
                          child: const Text(
                            'X??a b??i vi???t',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            Divider(
              color: AppColors.gray,
            ),
          ],
        );
      },
    );
  }

  Widget _buildWattingPost(List<Room> list) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage:
                      CachedNetworkImageProvider(list[index].userAvatar),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[index].userName,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      DateHelper.getTimeAgo(list[index].timePost),
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 13,
                        letterSpacing: 0.8,
                      ),
                    )
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) {
                      return WattingDetailScreen(
                          back: 0, postId: list[index].postID);
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: AppDimensions.d30w,
                            height: AppDimensions.d12h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: list[index].imgUrl![0],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: AppDimensions.d49w,
                                height: AppDimensions.d8h,
                                child: Text(
                                  list[index].content,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(fontSize: AppFontSizes.fs12),
                                ),
                              ),
                              Text("Gi?? ph??ng: " +
                                  list[index].cost.toString() +
                                  " VN??"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 24,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32.0),
                                ),
                              ),
                              title: const Text(
                                "X??c nh???n duy???t b??i vi???t",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              content:
                                  const Text("B???n mu???n duy???t b??i vi???t n??y ?"),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    "Duy???t",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    wattingBloc.showPost(list[index].postID);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    "Tho??t",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.orange1,
                              AppColors.orange2,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          height: 24,
                          alignment: Alignment.center,
                          child: const Text(
                            'Duy???t b??i vi???t',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 24,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32.0),
                                ),
                              ),
                              title: const Text(
                                "X??c nh???n x??a b??i",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              content:
                                  const Text("B???n mu???n x??a b??i vi???t n??y ?"),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    "X??a",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    wattingBloc.deletePost1(list[index].postID);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    "Tho??t",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.orange1,
                              AppColors.orange2,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          height: 24,
                          alignment: Alignment.center,
                          child: const Text(
                            'X??a b??i vi???t',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            Divider(
              color: AppColors.gray,
            ),
          ],
        );
      },
    );
  }
}
