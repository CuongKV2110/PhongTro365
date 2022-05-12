import 'package:flutter/cupertino.dart';

class DividerWidget extends StatelessWidget {
  int height;

  DividerWidget(this.height);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height.toDouble(),
      ),
    );
  }
}
