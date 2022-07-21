import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';

import '../../../../models/room.dart';
import '../../detail_room_screen/pages/detail_room_screen.dart';
import '../widgets/share_item.dart';

class SearchScreen extends StatefulWidget {
  List<Room> list;
  String type;

  SearchScreen(this.list, this.type);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(
          widget.type,
          style: TextStyle(color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.6,
            crossAxisSpacing: 26,
            mainAxisSpacing: 36,
          ),
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) {
                        return DetailRoomScreen(
                            back: 0, postId: widget.list[index].postID);
                      },
                    ),
                  );
                },
                child: ShareItem(widget.list[index]),
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
              ),
            );
          },
        ),
      ),
    );
  }
}
