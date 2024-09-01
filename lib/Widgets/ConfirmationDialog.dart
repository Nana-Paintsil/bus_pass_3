import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String message;
  final Function(bool) onConfirm;

  ConfirmationDialog({required this.message, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Align(
          alignment: Alignment.center,
          child: Text(
            'Confirm Action',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.warning,
            color: Colors.amber,
            size: 30,
          ),
          SizedBox(height: 15),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            onConfirm(true);
            Navigator.of(context).pop();
          },
          child: Text(
            'Yes',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onConfirm(false);
            Navigator.of(context).pop();
          },
          child: Text(
            'No',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
