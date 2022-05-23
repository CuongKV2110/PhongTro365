import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/ui/screen/profile_screen/pages/profile_screen.dart';
import '../../../../models/room.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';
import '../bloc/newfeed_bloc.dart';
import '../bloc/newfeed_state.dart';
import 'button_widget.dart';
import 'info_widget.dart';

class BuildNewFeed extends StatefulWidget {
  const BuildNewFeed({Key? key}) : super(key: key);

  @override
  _BuildNewFeedState createState() => _BuildNewFeedState();
}

class _BuildNewFeedState extends State<BuildNewFeed> {
  NewFeedBloc bloc = NewFeedBloc();
  final ScrollController _controller = ScrollController();
  String img_url1 =
      'https://cdn.luxstay.com/users/9405/J7uB6ERI91TpUk80QSwRNF-N.jpg';
  String img_url2 =
      'https://cdn.luxstay.com/rooms/31878/large/room_31878_3_1567770866.jpg';

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
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(
          const Duration(seconds: 2),
        );
        bloc.refreshData();
      },
      child: BlocProvider<NewFeedBloc>(
        create: (context) => bloc..getData(),
        child: BlocBuilder<NewFeedBloc, NewFeedState>(
          builder: (context, state) {
            if (state is NewFeedLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewFeedLoaded) {
              return ListView.builder(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.data.length,
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
                                _buildHeader(state.data[index]),
                                const SizedBox(height: 10),
                                _buildImage(state.data[index]),
                                const SizedBox(height: 10),
                                _buildIcon(),
                                const SizedBox(height: 10),
                                _buildContent(state.data[index]),
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
            } else if (state is NewFeedError) {
              return const Center(
                child: Text('Loi'),
              );
            }
            return const Center();
          },
        ),
      ),
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
                  return ProfileScreen();
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
                    imageUrl: room.imgUrl,
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
                        imageUrl: img_url1,
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
                        imageUrl: img_url2,
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

  Widget _buildIcon() {
    return Row(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  /*bloc.list[index].isTym = !bloc.list[index].isTym;*/
                });
              },
              child: const Icon(
                Icons.favorite_outline,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              '2.3K',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                fontSize: 12,
              ),
            )
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              /*bloc.list[index].isSave = !bloc.list[index].isSave;*/
            });
          },
          child: const Icon(
            Icons.bookmark_outline,
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
      style: const TextStyle(color: AppColors.black, fontSize: 12, height: 1.7),
    );
  }
}
