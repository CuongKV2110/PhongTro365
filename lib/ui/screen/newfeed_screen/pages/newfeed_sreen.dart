import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/ui/screen/detail_room_screen/pages/detail_room_screen.dart';
import 'package:phongtro/ui/screen/newfeed_screen/widgets/build_home_bar.dart';
import 'package:phongtro/ui/screen/newfeed_screen/widgets/divider_widget.dart';
import 'package:phongtro/ui/screen/newfeed_screen/widgets/post_widget.dart';

import '../widgets/build_options.dart';
import '../widgets/search_widget.dart';

class NewFeedScreen extends StatefulWidget {
  const NewFeedScreen({Key? key}) : super(key: key);

  @override
  _NewFeedScreenState createState() => _NewFeedScreenState();
}

class _NewFeedScreenState extends State<NewFeedScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              DividerWidget(10),
              SearchWidget(),
              DividerWidget(20),
              BuildOptions(),
              DividerWidget(10),
              SliverToBoxAdapter(
                  child: Container(
                height: 6,
                color: AppColors.gray,
              )),
              DividerWidget(10),
              PostWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
