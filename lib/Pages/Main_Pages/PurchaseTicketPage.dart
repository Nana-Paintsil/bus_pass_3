import 'package:bus_pass_3/Models/Scoped_Model.dart';
import 'package:bus_pass_3/api.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Widgets/DialogBox.dart';

class PurchaseTicketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PurchaseTicketPageState();
  }
}

class _PurchaseTicketPageState extends State<PurchaseTicketPage> {
  String? selectedstartingPoint;
  String? selectedEnd;
  Tenant? selectedTenant;
  Journey? selectedJourney;
  List<String> filteredstartingPoints = [];
  List<String> filteredDestinations = [];
  List<String> tenants = [];
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  bool isBusy = false;
  @override
  void initState() {
    ScopedModel.of<MyScopedModel>(context).allTenants.forEach((element) {
      if (element.shortName != "System") tenants.add(element.shortName!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyScopedModel>(
        builder: ((context, child, model) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: model.myColor,
            title: Text("Buy Bus Ticket"),
            centerTitle: true),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BUS COMPANY: ",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                    // the menu padding when button's width is not specified.
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  hint: const Text(
                    'Select Bus Company',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: tenants
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select the bus company you want to purchase ticket from';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedTenant = model.allTenants
                          .firstWhere((element) => element.shortName == value);
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                if (selectedTenant != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "FROM",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                width: 2.0), // Set border color to black
                            borderRadius: BorderRadius.circular(
                                2.0), // Customize border radius
                          ),
                          child: TextFormField(
                            controller: startController,
                            onChanged: (value) {
                              setState(() {
                                selectedstartingPoint = value;
                                if (startController.text != "") {
                                  filteredstartingPoints = model.allJourneys
                                      .where((journey) =>
                                          journey.startingPoint!
                                              .toLowerCase()
                                              .contains(value.toLowerCase()) &&
                                          journey.tenantId! ==
                                              selectedTenant!.id)
                                      .map((journey) => journey.startingPoint!)
                                      .toList();
                                } else {
                                  filteredstartingPoints = [];
                                }
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Select startingPoint',
                              prefixIcon: Icon(Icons.search),
                              contentPadding: EdgeInsets.all(16.0),

                              border: InputBorder.none, // H
                            ),
                          )),
                    ],
                  ),
                SizedBox(height: 10),
                if (filteredstartingPoints.isNotEmpty)
                  Container(
                      color: Colors
                          .grey[200], // Set the background color for ListView
                      child: Card(
                          elevation: 4.0, // Add elevation for card effect
                          // margin: EdgeInsets.all(3.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: filteredstartingPoints.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(filteredstartingPoints[index]),
                                onTap: () {
                                  setState(() {
                                    selectedstartingPoint =
                                        filteredstartingPoints[index];
                                    startController.text =
                                        selectedstartingPoint!;
                                    filteredstartingPoints = [];
                                    selectedJourney = null;
                                    if (endController.text != "") {
                                      selectedJourney = model.allJourneys
                                          .firstWhere((element) =>
                                              element.startingPoint ==
                                                  selectedstartingPoint &&
                                              element.destination ==
                                                  selectedEnd);
                                    }
                                  });
                                },
                              );
                            },
                          ))),
                if (model.allJourneys.any((element) =>
                        element.startingPoint == selectedstartingPoint) ||
                    selectedEnd != null)
                  SizedBox(height: 20),
                if (model.allJourneys.any((element) =>
                        element.startingPoint == selectedstartingPoint) ||
                    selectedEnd != null)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "TO",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 2.0), // Set border color to black
                              borderRadius: BorderRadius.circular(
                                  2.0), // Customize border radius
                            ),
                            child: TextFormField(
                              controller: endController,
                              onChanged: (value) {
                                setState(() {
                                  selectedEnd = value;
                                  if (endController.text != "") {
                                    filteredDestinations = model.allJourneys
                                        .where((journey) =>
                                            journey.destination!
                                                .toLowerCase()
                                                .contains(
                                                    value.toLowerCase()) &&
                                            journey.tenantId! ==
                                                selectedTenant!.id)
                                        .map((journey) => journey.destination!)
                                        .toList();
                                  } else {
                                    filteredDestinations = [];
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Select Destination',
                                prefixIcon: Icon(Icons.search),
                              ),
                            ))
                      ]),
                SizedBox(height: 20),
                if (filteredDestinations.length > 0)
                  Container(
                      color: Colors
                          .grey[200], // Set the background color for ListView
                      child: Card(
                          elevation: 4.0, // Add elevation for card effect
                          // margin: EdgeInsets.all(3.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: filteredDestinations.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(filteredDestinations[index]),
                                onTap: () {
                                  setState(() {
                                    selectedEnd = filteredDestinations[index];
                                    endController.text = selectedEnd!;
                                    selectedJourney = model.allJourneys
                                        .firstWhere((element) =>
                                            element.startingPoint ==
                                                selectedstartingPoint &&
                                            element.destination == selectedEnd);

                                    filteredDestinations = [];
                                  });
                                },
                              );
                            },
                          ))),
                SizedBox(height: 20),
                selectedJourney != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "PRICE",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  model
                                      .valueToCurrency(selectedJourney!.price!),
                                  style: TextStyle(fontSize: 19),
                                ))
                          ])
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                selectedJourney != null
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isBusy = true;
                            });
                            var result = await model.fetchJourneyDetails(
                                selectedJourney!.id.toString());
                            if (result.activeBus != null) {
                              var activeBus = result.activeBus;
                              activeBus!.stops = result.stops;
                              if (result.activeBus!.currentCapacity! <
                                  result.activeBus!.maxCapacity!) {
                                PayWithPayStack().now(
                                    context: context,
                                    secretKey:
                                        "sk_live_bd12c82610b51cd9a788abfcc5ceaf35e1ee66ac",
                                    customerEmail: model.userEmail!,
                                    reference: DateTime.now()
                                        .microsecondsSinceEpoch
                                        .toString(),
                                    currency: "GHS",
                                    amount: convertToPesewas(2),
                                    transactionCompleted: () async {
                                      BusTicket busTicket = BusTicket(
                                          id: model.generateGuid(),
                                          userId: model.userId,
                                          bus: result.activeBus!,
                                          tenantId: result.tenantId,
                                          startingPoint:
                                              selectedJourney!.startingPoint,
                                          endingPoint:
                                              selectedJourney!.destination,
                                          seatNo: getSeatNumber(
                                              result.activeBus!
                                                      .currentCapacity! +
                                                  1,
                                              result.activeBus!.maxCapacity!,
                                              '2+2'),
                                          dateOfPurchase: DateTime.now(),
                                          price: selectedJourney!.price,
                                          isActive: true);
                                      await model.busticketApi.busTicketAddPost(
                                          busTicket: busTicket);
                                      model.userTickets.add(busTicket);

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CustomDialog(success: true),
                                      ).then((value) {
                                        setState(() {
                                          isBusy = false;
                                        });
                                      });
                                    },
                                    callbackUrl:
                                        "https://buspassapi.azurewebsites.net/",
                                    transactionNotCompleted: () {
                                      print("Transaction Not Successful!");
                                    });
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CustomDialog(success: false),
                                ).then((value) {
                                  setState(() {
                                    isBusy = false;
                                  });
                                });
                                ;
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomDialog(success: false),
                              ).then((value) {
                                setState(() {
                                  isBusy = false;
                                });
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade400,
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 20),
                          ),
                          child: isBusy == true
                              ? SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.white,
                                  )),
                                )
                              : Text('Purchase Bus Ticket'),
                        ),
                      )
                    : SizedBox()
              ],
            ))),
      );
    }));
  }
}

String convertToPesewas(double price) {
  var p = price * 100;
  return p.toString();
}

String getSeatNumber(int seatIndex, int totalSeats, String configuration) {
  if (configuration == '2+2') {
    if (totalSeats - seatIndex < 4) {
      return "$seatIndex";
    } else {
      if (seatIndex % 4 == 1) {
        return "$seatIndex" + "W";
      }
      if (seatIndex % 4 == 2) {
        return "$seatIndex" + "A";
      }
      if (seatIndex % 4 == 3) {
        return "$seatIndex" + "A";
      }
      if (seatIndex % 4 == 0) {
        return "$seatIndex" + "W";
      }
    }
    return "$seatIndex";
  } else if (configuration == '2+1') {
    if (totalSeats - seatIndex < 4) {
      return "$seatIndex";
    } else {
      if (seatIndex % 3 == 1) {
        return "$seatIndex" + "W";
      }
      if (seatIndex % 3 == 2) {
        return "$seatIndex" + "A";
      }
      if (seatIndex % 3 == 0) {
        return "$seatIndex";
      }
    }
    return "$seatIndex";
  } else {
    return 'Invalid configuration';
  }
}
