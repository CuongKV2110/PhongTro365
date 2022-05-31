import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/helpers/date_helper.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/ui/screen/detail_room_screen/bloc/comment_bloc/comment_bloc.dart';
import 'package:phongtro/ui/screen/detail_room_screen/bloc/comment_bloc/comment_state.dart';

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
            return Text('Chuaw co comemt');
          }
          return Center();
        },
      ),
    );
  }

  _buildCommentDetail(BuildContext context, List<CommentDetail> list) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 16,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(list[index].avt),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            list[index].username,
                            style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            DateHelper.getTimeAgo(list[index].comment.time),
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      Text(
                        list[index].comment.content,
                        style: const TextStyle(color: AppColors.black),
                      ),
                    ],
                  )
                ],
              );
            },
          )),
    );
  }
}
