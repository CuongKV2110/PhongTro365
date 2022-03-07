
import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';

class NotifiScreen extends StatefulWidget {
  const NotifiScreen({Key? key}) : super(key: key);

  @override
  _NotifiScreenState createState() => _NotifiScreenState();
}

class _NotifiScreenState extends State<NotifiScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: AppColors.white,
          title: const Text(
            'Notifications',
            style: TextStyle(color: AppColors.black),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/code1.jpg'),
                      ),
                      const SizedBox(width: 16,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppDimensions.d60w,
                            height: AppDimensions.d5h,
                            child: Text(
                              'Kieu Van Cuong da tra loi binh luan cua ban',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(fontSize: AppFontSizes.fs12),
                            ),
                          ),
                          const SizedBox(height: 4,),
                          const Text('About 23 minutes ago'),
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.more_horiz_outlined)
                ],
              ),
            );
          },
          itemCount: 10,
        )
      ),
    );
  }
}
