import 'package:flutter/material.dart';
import 'package:phongtro/generated/l10n.dart';
import 'package:phongtro/resources/colors.dart';
import 'package:phongtro/resources/dimensions.dart';
import 'package:ionicons/ionicons.dart';
import 'package:phongtro/resources/fontsizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: AppDimensions.d90w,
                  height: AppDimensions.d34h,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: AppColors.gray))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage('images/bgr.png'),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kiều Văn Cường',
                                style: TextStyle(
                                    color: AppColors.color12031F,
                                    fontSize: AppFontSizes.fs20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Người thuê trọ',
                                style: TextStyle(
                                  color: AppColors.color12031F,
                                  fontSize: AppFontSizes.fs12,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Ionicons.call_outline,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '0367031430',
                            style: TextStyle(fontSize: AppFontSizes.fs16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Ionicons.mail_outline,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'cuongkv.it@gmail.com',
                            style: TextStyle(fontSize: AppFontSizes.fs16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Ionicons.location_outline,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Nam Tu Liem, Ha Noi',
                            style: TextStyle(fontSize: AppFontSizes.fs16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: SizedBox(
                    width: AppDimensions.d90w,
                    height: 64,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit_outlined,
                          size: 30,
                          color: AppColors.blue700,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          S.of(context).change_info,
                          style: TextStyle(
                              color: AppColors.color12031F,
                              fontSize: AppFontSizes.fs16),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: SizedBox(
                    width: AppDimensions.d90w,
                    height: 64,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.library_books_outlined,
                          size: 30,
                          color: AppColors.blue700,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          S.of(context).my_post,
                          style: TextStyle(
                              color: AppColors.color12031F,
                              fontSize: AppFontSizes.fs16),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: SizedBox(
                    width: AppDimensions.d90w,
                    height: 64,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite_outline,
                          size: 30,
                          color: AppColors.blue700,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          S.of(context).saved,
                          style: TextStyle(
                              color: AppColors.color12031F,
                              fontSize: AppFontSizes.fs16),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: SizedBox(
                    width: AppDimensions.d90w,
                    height: 64,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings_outlined,
                          size: 30,
                          color: AppColors.blue700,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          S.of(context).setting,
                          style: TextStyle(
                              color: AppColors.color12031F,
                              fontSize: AppFontSizes.fs16),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: SizedBox(
                    width: AppDimensions.d90w,
                    height: 64,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.assignment_outlined,
                          size: 30,
                          color: AppColors.blue700,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          S.of(context).app_info,
                          style: TextStyle(
                              color: AppColors.color12031F,
                              fontSize: AppFontSizes.fs16),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('Log  Out');
                  },
                  child: SizedBox(
                    width: AppDimensions.d90w,
                    height: 64,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.power_settings_new_outlined,
                          size: 30,
                          color: AppColors.red,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          S.of(context).logout,
                          style: TextStyle(
                              color: AppColors.red,
                              fontSize: AppFontSizes.fs16),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
