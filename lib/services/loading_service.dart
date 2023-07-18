import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingService {
  void showLoading(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('Сиздин маалыматтыңыз жүктөлүүдө'),
          content: CupertinoActivityIndicator(),
        );
      },
    );
  }
}