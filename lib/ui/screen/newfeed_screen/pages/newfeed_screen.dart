import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import '../widgets/build_newfeed.dart';
import '../widgets/build_newfeed_bar.dart';

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                SizedBox(
                  height: 10,
                ),
                BuildNewFeedBar(),
                BuildNewFeed(),
              ],
            )),
      ),
    );
  }
}
