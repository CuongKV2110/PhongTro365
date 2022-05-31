import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';

import '../../../../models/comment.dart';
import '../../../../models/room.dart';

class BuildComments extends StatefulWidget {
  Room room;

  BuildComments(this.room);

  @override
  _BuildCommentsState createState() => _BuildCommentsState();
}

class _BuildCommentsState extends State<BuildComments> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
        child: widget.room.comment != null
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: widget.room.comment?.length,
                itemBuilder: (context, index) {
                  return Text(
                    widget.room.comment![index],
                    style: const TextStyle(color: AppColors.black),
                  );
                },
              )
            : Text('Khong co comment'),
      ),
    );
  }
}
