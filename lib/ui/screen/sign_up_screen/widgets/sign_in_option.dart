import 'package:flutter/cupertino.dart';

import '../../../../resources/colors.dart';

class SignInOption extends StatelessWidget {
  const SignInOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account ! ',
            style: TextStyle(color: AppColors.white, fontSize: 14),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Sign In',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
