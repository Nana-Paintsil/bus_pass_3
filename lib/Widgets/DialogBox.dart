import 'package:bus_pass_3/Pages/Screens/BookingScreen.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final bool success;

  CustomDialog({required this.success});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            success ? Icons.check_circle : Icons.error,
            color: success ? Colors.green : Colors.red,
            size: 50.0,
          ),
          SizedBox(height: 16.0),
          Text(
            success
                ? 'Bus ticket purchased successfully!'
                : "There's no bus being loaded this moment. Please try again later",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24.0),
          GestureDetector(
            onTap: () {
              if (success) {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => BookingScreen())));
              } else {
                Navigator.of(context).pop();
              } // Close the dialog
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
