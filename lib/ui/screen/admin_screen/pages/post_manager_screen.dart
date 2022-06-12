import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/models/write_detail.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/ui/screen/newfeed_screen/bloc/newfeed_state.dart';
import 'package:phongtro/ui/screen/profile_screen/pages/view_profile.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../models/room.dart';
import '../../../../resources/dimensions.dart';
import '../../newfeed_screen/bloc/newfeed_bloc.dart';
import '../../newfeed_screen/widgets/button_widget.dart';
import '../../newfeed_screen/widgets/info_widget.dart';

class PostManagerScreen extends StatefulWidget {
  const PostManagerScreen({Key? key}) : super(key: key);

  @override
  _PostManagerScreenState createState() => _PostManagerScreenState();
}

class _PostManagerScreenState extends State<PostManagerScreen> {
  NewFeedBloc bloc = NewFeedBloc();

  @override
  void initState() {
    super.initState();
    bloc.getData();
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
            create: (context) => bloc,
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
                        const Text(
                          'Bài viết cho thuê phòng',
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildNewFeed(state.result.room),
                        const Divider(
                          color: AppColors.gray,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Bài viết tìm phòng',
                          style: TextStyle(
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _buildListPost(state.result.write),
                        const SizedBox(
                          height: 10,
                        ),
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

  Widget _buildListPost(List<WriteDetail> write) {
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
              height: 20,
            ),
            Text(write[index].write.content),
            const SizedBox(
              height: 20,
            ),
            _buildButtonPost(write[index].write.writeId),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Column(
          children: const [
            SizedBox(
              height: 20,
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

  Widget _buildButtonPost(String postID) {
    return Row(
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
                        "Xác nhận ẩn bài viết",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      content: const Text("Bạn muốn ẩn bài viết này ?"),
                      actions: [
                        TextButton(
                          child: const Text(
                            "Ẩn",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            bloc.hideWrite(postID);
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            "Thoát",
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
                    'Ẩn bài viết',
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
                        "Xác nhận xóa bài",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      content: const Text("Bạn muốn xóa bài viết này ?"),
                      actions: [
                        TextButton(
                          child: const Text(
                            "Xóa",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            bloc.deleteWrite(postID);
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            "Thoát",
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
                    'Xóa bài viết',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
                  children: [
                    const SizedBox(height: 340),
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
    Room room = Room(
      status: 0,
      owner: "Chung chủ",
      type: 'Phòng trống',
      people: 32,
      acreage: 1,
      cost: 1,
      location: "ADADAD",
      phone: 1,
      water: 1,
      electricity: 1,
      internet: 1,
      wifi: true,
      wc: true,
      time: true,
      vehicle: true,
      kitchen: true,
      fridge: true,
      washing: true,
      conditioning: true,
      content: '',
      imgUrl: [],
      comment: [],
      postID: 'postID',
      userID: 'userID',
      userAvatar: 'userAvatar',
      userName: 'userName',
      timePost: 2,
    );

    for (int i = 0; i < data.length - 1; i++) {
      for (int j = i + 1; j < data.length; j++) {
        if (data[i].timePost < data[j].timePost) {
          room = data[i];
          data[i] = data[j];
          data[j] = room;
        }
      }
    }

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
                      _buildContent(data[index]),
                      const SizedBox(height: 10),
                      _buildButton(data[index].postID),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        });
  }

  Widget _buildButton(String postID) {
    return Row(
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
                        "Xác nhận ẩn bài viết",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      content: const Text("Bạn muốn ẩn bài viết này ?"),
                      actions: [
                        TextButton(
                          child: const Text(
                            "Ẩn",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            bloc.hidePost(postID);
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            "Thoát",
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
                    'Ẩn bài viết',
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
                        "Xác nhận xóa bài",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      content: const Text("Bạn muốn xóa bài viết này ?"),
                      actions: [
                        TextButton(
                          child: const Text(
                            "Xóa",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            bloc.deletePost(postID);
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text(
                            "Thoát",
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
                    'Xóa bài viết',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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

  Widget _buildContent(Room room) {
    return Text(
      room.content,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: AppColors.black, fontSize: 13, height: 1.7),
    );
  }
}
