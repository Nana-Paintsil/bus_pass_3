import 'package:bus_pass_3/Models/Scoped_Model.dart';
import 'package:bus_pass_3/Pages/Screens/BookingScreen.dart';
import 'package:bus_pass_3/Widgets/InformationDialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Widgets/ConfirmationDialog.dart';
import '../../api.dart';

class PassDetails extends StatefulWidget {
  final Pass pass;

  const PassDetails({required this.pass});
  @override
  State<StatefulWidget> createState() {
    return _PassDetailsState(pass: pass);
  }
}

class _PassDetailsState extends State<PassDetails> {
  final Pass pass;

  _PassDetailsState({required this.pass});
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyScopedModel>(
        builder: ((context, child, model) {
      return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: model.myColor,
              title: Text("Pass Details")),
          body: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/main_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        color: Colors
                            .grey[200], // Set the background color for ListView
                        child: Card(
                          elevation: 4.0, // Add elevation for card effect
                          // margin: EdgeInsets.all(3.0),
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("ROUTE"),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            pass.passJourney!.startingPoint
                                                    .toString() +
                                                " - " +
                                                pass.passJourney!.destination
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )),
                        )),
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "BOOKING DETAILS",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )),
                        Container(
                            width: double.infinity,
                            color: Colors.grey[
                                200], // Set the background color for ListView
                            child: Card(
                                elevation: 4.0, // Add elevation for card effect
                                // margin: EdgeInsets.all(3.0),
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "PASS PURCHASED",
                                              style: TextStyle(
                                                  color: Colors.grey.shade700),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              formatDateTime(
                                                  pass.dateOfPurchase!),
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "PASS VALID TILL",
                                              style: TextStyle(
                                                  color: Colors.grey.shade700),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              formatDateTime2(
                                                  pass.dateOfPurchase!,
                                                  pass.validDays!),
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        pass.isActive == false
                                            ? Container(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .warning_amber_outlined,
                                                      size: 30,
                                                      color: Colors.red,
                                                    ),
                                                    Text(
                                                      " Expired",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.red),
                                                    )
                                                  ],
                                                ))
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "DAYS REMAINING",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade700),
                                                  ),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                    formatDateTime3(
                                                        pass.dateOfPurchase!,
                                                        pass.validDays!),
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                      ],
                                    )))),
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            color: Colors.grey[
                                200], // Set the background color for ListView
                            child: Card(
                                elevation: 4.0, // Add elevation for card effect
                                // margin: EdgeInsets.all(3.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 10),
                                      child: Text("DEPARTURE TIMES",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey.shade600)),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          pass.passJourney!.stops!.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                            title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              pass.passJourney!.stops![index]
                                                  .name!,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                                '${pass.passJourney!.stops![index].departureTime!.hour.toString().padLeft(2, '0')}:${pass.passJourney!.stops![index].departureTime!.minute.toString().padLeft(2, '0')}',
                                                style: TextStyle(fontSize: 18))
                                          ],
                                        ));
                                      },
                                    )
                                  ],
                                ))),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              pass.isActive = true;
                              await model.passesApi
                                  .passUpdatePassPut(pass: pass);
                              int index = model.userPasses.indexWhere(
                                  (element) => element.id == pass.id);
                              model.userPasses.elementAt(index).isActive = true;
                              model.userPasses.elementAt(index).dateOfPurchase =
                                  DateTime.now();
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    InformationDialog(
                                  message: 'Bus Pass Renewed Successfully',
                                ),
                              ).then((_) {
                                // This code will execute after the dialog is dismissed
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookingScreen()),
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  left: 40, top: 10, right: 40, bottom: 10),
                              backgroundColor: model.myColor,
                              side: BorderSide(color: model.myColor),
                            ),
                            child:
                                Text('Renew', style: TextStyle(fontSize: 20)),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              bool con = false;

                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    ConfirmationDialog(
                                  message:
                                      'Are you sure you want to cancel the bus pass?',
                                  onConfirm: (bool confirmed) async {
                                    if (confirmed) {
                                      con = true;
                                      pass.isActive = false;
                                      await model.passesApi
                                          .passUpdatePassPut(pass: pass);
                                      int index = model.userPasses.indexWhere(
                                          (element) => element.id == pass.id);
                                      model.userPasses
                                          .elementAt(index)
                                          .isActive = false;
                                    } else {
                                      print('Action canceled.');
                                    }
                                  },
                                ),
                              ).then((_) {
                                // This code will execute after the dialog is dismissed
                                if (con) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookingScreen()),
                                  );
                                }
                              });
                              ;
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  left: 40, top: 10, right: 40, bottom: 10),
                              backgroundColor: Colors.white,
                              side: BorderSide(color: model.myColor),
                            ),
                            child: Text(
                              'Cancel',
                              style:
                                  TextStyle(fontSize: 20, color: model.myColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )));
    }));
  }
}

String formatDateTime(DateTime dateTime) {
  final formatter = DateFormat('dd MMM yyyy, h:mm a');
  return formatter.format(dateTime);
}

String formatDateTime2(DateTime dateTime, int validDays) {
  dateTime = dateTime.add(Duration(days: validDays));
  final formatter = DateFormat('dd MMM yyyy, h:mm a');
  return formatter.format(dateTime);
}

String formatDateTime3(DateTime dateTime, int validDays) {
  final now = DateTime.now();
  dateTime = dateTime.add(Duration(days: validDays));
  var days = dateTime.difference(now);
  return days.inDays.toString();
}
