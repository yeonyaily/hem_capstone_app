import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialog{
  static void showDialog({String title = "", String content = ""}) => Get.dialog(
    Builder(
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                content,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: new Text("확인"),
              onPressed: ()=> Get.back(),
            ),
          ],
        );
      }
    ),
    barrierDismissible: false,
  );
}