import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/helpers/date_helper.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/ui/screen/detail_room_screen/bloc/comment_bloc/comment_bloc.dart';
import 'package:phongtro/ui/screen/detail_room_screen/bloc/comment_bloc/comment_state.dart';
import 'package:phongtro/ui/screen/detail_room_screen/widgets/dot_center.dart';

import '../../../../models/comment_detail.dart';
import '../../../../models/room.dart';

class BuildComments extends StatefulWidget {
  Room room;

  BuildComments(this.room);

  @override
  _BuildCommentsState createState() => _BuildCommentsState();
}

class _BuildCommentsState extends State<BuildComments> {
  CommentBloc bloc = CommentBloc();

  @override
  void initState() {
    bloc.LoadComment(widget.room);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommentBloc>(
      create: (context) => bloc,
      child: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CommentLoaded) {
            return _buildCommentDetail(context, state.listComment);
          }
          if (state is CommentError) {
            return const Text('Chưa co comemt');
          }
          return const Center();
        },
      ),
    );
  }

  _buildCommentDetail(BuildContext context, List<CommentDetail> list) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 4, 26, 50),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(list[index].avt),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.gray.withOpacity(0.6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 8, 10, 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                list[index].username,
                                style: const TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                list[index].comment.content,
                                style: TextStyle(height: 1.6),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            DateHelper.getTimeAgo(list[index].comment.time),
                            style: const TextStyle(),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const DotCenter(),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text('Thích'),
                          const SizedBox(
                            width: 6,
                          ),
                          const DotCenter(),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text('Trả lời'),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
