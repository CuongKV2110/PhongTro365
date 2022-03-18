import 'package:flutter/material.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:phongtro/resources/fontsizes.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: AppColors.white,
          title: const Text(
            'Saved Posts',
            style: TextStyle(color: AppColors.black),
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: AppDimensions.d30w,
                        height: AppDimensions.d12h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/room2.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppDimensions.d49w,
                            height: AppDimensions.d8h,
                            child: Text(
                              "Hiện tại mình hello đang có phòng cho thuê tại Số 7, ngõ 2, Mễ Trì Hạ, Nam Từ Liêm",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(fontSize: AppFontSizes.fs12),
                            ),
                          ),
                          const Text('Saved about 2 days ago'),
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.more_horiz_outlined)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
