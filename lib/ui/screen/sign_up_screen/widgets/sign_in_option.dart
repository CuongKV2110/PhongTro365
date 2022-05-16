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
            'Bạn đã có tài khoản ? ',
            style: TextStyle(color: AppColors.black, fontSize: 14),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Đăng nhập',
              style: TextStyle(
                color: AppColors.black,
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
