import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/ui/screen/newfeed_screen/bloc/newfeed_state.dart';
import 'package:phongtro/ui/screen/profile_screen/pages/view_profile.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../models/room.dart';
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
                        const BuildNewFeedBar(),
                        _buildNewFeed(state.data),
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

  Widget _buildShimmer() {
    return Container(
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
      owner: "Chung chủ",
      type: 'Phòng trống',
      people: "32",
      acreage: "",
      cost: '3',
      location: "ADADAD",
      phone: "ADĐ",
      water: '34',
      electricity: '34',
      internet: 'internet',
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
      postID: 'postID',
      userID: 'userID',
      userAvatar: 'userAvatar',
      userName: 'userName',
      timePost: 2,
    );

    for (int i = 0; i < data.length - 1; i++) {
      for (int j = i + 1; j < data.length; j++) {
        if (data[i].timePost < data[j].timePost) {
          // Hoan vi 2 so a[i] va a[j]
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
                      _buildIcon(data[index]),
                      const SizedBox(height: 10),
                      _buildContent(data[index]),
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
          child: InfoWidget(room),
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
        GestureDetector(
          onTap: () {
            setState(() {
              /*bloc.list[index].isSave = !bloc.list[index].isSave;*/
            });
          },
          child: const Icon(
            Ionicons.bookmark_outline,
            color: AppColors.black,
          ),
        ),
      ],
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
