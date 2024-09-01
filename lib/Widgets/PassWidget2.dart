import 'package:bus_pass_3/Pages/Main_Pages/PassDetails.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api.dart';

class PassWidget extends StatelessWidget {
  final Pass pass;

  const PassWidget({required this.pass});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PassDetails(
                            pass: pass,
                          )));
            },
            child: Card(
                elevation: 4, // Adjust the elevation value as needed
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/card_background.png'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "FROM",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey.shade600),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                pass.passJourney!.startingPoint!,
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "TO",
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey.shade600),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  pass.passJourney!.destination!,
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 20,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 18,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DATE OF PURCHASE",
                                style: TextStyle(
                                    fontSize: 11, color: Colors.grey.shade600),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                formatDate(pass.dateOfPurchase!),
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                          pass.isActive == false
                              ? Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.warning_amber_outlined,
                                        size: 30,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        " Expired",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.red),
                                      )
                                    ],
                                  ))
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "REMAINING DAYS",
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey.shade600),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      calculateRemainingDays(
                                          pass.dateOfPurchase!,
                                          pass.validDays!),
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                          SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ))));
  }
}

String formatDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat('E, d MMM yy');
  return formatter.format(dateTime);
}

String calculateRemainingDays(DateTime initialDate, int validDays) {
  final currentDate = DateTime.now();
  final difference =
      initialDate.add(Duration(days: validDays)).difference(currentDate);
  final remainingDays = difference.inDays;

  return remainingDays.toString();
}
