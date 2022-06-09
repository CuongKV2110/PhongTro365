import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phongtro/ui/screen/post_screen/pages/post1_screen.dart';
import 'package:phongtro/ui/screen/write_screen/pages/write_screen.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/dimensions.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'images/2.png',
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) {
                          return const WriteScreen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.orange1,
                          AppColors.orange2,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Container(
                      width: AppDimensions.d80w,
                      height: 56,
                      alignment: Alignment.center,
                      child: const Text(
                        'Tìm phòng',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (builder) {
                          return const Post1Screen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.orange1,
                          AppColors.orange2,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Container(
                      width: AppDimensions.d80w,
                      height: 56,
                      alignment: Alignment.center,
                      child: const Text(
                        'Cho thuê phòng',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
