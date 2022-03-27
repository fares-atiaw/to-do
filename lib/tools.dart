import 'package:flutter/material.dart';

void showMessage(BuildContext context, String message, String actionText) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          content: Text(message),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(actionText))
          ],
        );
      });
}

void showLoading(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(157, 158, 165, 0.4),
          content: Row(
            children: [
              Text(message),
              SizedBox(
                width: 10,
              ),
              CircularProgressIndicator()
              /*Directionality(
                  textDirection: TextDirection.ltr,
                  child: LinearProgressIndicator()),*/
            ],
          ),
        );
      });
}
