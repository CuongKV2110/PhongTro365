import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../sign_up_screen/pages/sign_up_screen.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Didn\'t have any account ? ',
                style: TextStyle(color: AppColors.white, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpScreen();
                      },
                    ),
                  );
                },
                child: const Text(
                  'Sign Up here',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'By Singing In, you agree to our terms & conditions',
            style: const TextStyle(color: AppColors.white, fontSize: 12),
          )
        ],
      ),
    );
  }
}
