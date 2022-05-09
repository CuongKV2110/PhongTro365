import 'package:flutter/cupertino.dart';

class UiHelper {
  static bool isModalShowing = false;

  static showLoading(BuildContext context) {
    isModalShowing = true;
    showGeneralDialog(
      context: context,
      barrierColor: CupertinoColors.black.withOpacity(0.1),
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              width: 70,
              height: 70,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const CupertinoActivityIndicator(
                    radius: 12,
                  )),
            ),
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    if (isModalShowing) {
      isModalShowing = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  static void showErrorDialog(BuildContext context, String message,
      {required String title}) {
    isModalShowing = true;
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: CupertinoAlertDialog(
            title: Text(title),
            content: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(message),
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                isDestructiveAction: true,
                child: const Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                  isModalShowing = false;
                },
              )
            ],
          ),
        );
      },
    );
  }
}
