import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';

class NewFeedScreen extends StatefulWidget {
  const NewFeedScreen({Key? key}) : super(key: key);

  @override
  _NewFeedScreenState createState() => _NewFeedScreenState();
}

class _NewFeedScreenState extends State<NewFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _buildNewRoom(),
              _buildShareRoom(),
              _buildNews(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewRoom() {
    return SizedBox(
      width: AppDimensions.d100w,
      height: AppDimensions.d50h,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 140,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          crossAxisCount: 2,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, index) {
          return Container(
            alignment: Alignment.center,
            child: Text(index.toString()),
            decoration: BoxDecoration(
                color: AppColors.colorItem1,
                borderRadius: BorderRadius.circular(15)),
          );
        },
      )
    );
  }

  Widget _buildShareRoom() {
    return SizedBox(
        width: AppDimensions.d100w,
        height: AppDimensions.d50h,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 140,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            crossAxisCount: 2,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, index) {
            return Container(
              alignment: Alignment.center,
              child: Text(index.toString()),
              decoration: BoxDecoration(
                  color: AppColors.colorItem1,
                  borderRadius: BorderRadius.circular(15)),
            );
          },
        )
    );
  }

  Widget _buildNews() {
    return SizedBox(
        width: AppDimensions.d100w,
        height: AppDimensions.d50h,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 140,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            crossAxisCount: 2,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, index) {
            return Container(
              alignment: Alignment.center,
              child: Text(index.toString()),
              decoration: BoxDecoration(
                  color: AppColors.colorItem1,
                  borderRadius: BorderRadius.circular(15)),
            );
          },
        )
    );
  }
}
