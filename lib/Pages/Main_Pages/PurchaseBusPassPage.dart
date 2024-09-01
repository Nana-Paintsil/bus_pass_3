import 'package:bus_pass_3/Models/Scoped_Model.dart';
import 'package:bus_pass_3/Pages/Screens/BookingScreen.dart';
import 'package:bus_pass_3/api.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../Widgets/DialogBox2.dart';

class PurchaseBusPassPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PurchaseTicketPageState();
  }
}

class _PurchaseTicketPageState extends State<PurchaseBusPassPage> {
  String? selectedstartingPoint;
  String? selectedEnd;
  PassJourney? selectedJourney;
  Tenant? selectedTenant;
  double? price;
  bool isBusy = false;
  int? validDays;
  List<String> passTypes = ["Daily Pass", "Weekly Pass", "Monthly Pass"];
  List<String> filteredstartingPoints = [];
  List<String> tenants = [];
  List<String> filteredDestinations = [];
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();

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
          centerTitle: true,
          title: Text("Purchase Bus Pass"),
        ),
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
                Column(
                  children: [
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: InputBorder.none),
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
                          selectedTenant = model.allTenants.firstWhere(
                              (element) => element.shortName == value);
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
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
                    selectedTenant != null
                        ? model.allPassJourneys.any((element) =>
                                element.tenantId == selectedTenant!.id)
                            ? Column(
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
                                              width:
                                                  2.0), // Set border color to black
                                          borderRadius: BorderRadius.circular(
                                              2.0), // Customize border radius
                                        ),
                                        child: TextFormField(
                                          controller: startController,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedstartingPoint = value;
                                              if (startController.text != "") {
                                                filteredstartingPoints = model
                                                    .allPassJourneys
                                                    .where((journey) => journey
                                                        .startingPoint!
                                                        .toLowerCase()
                                                        .contains(value
                                                            .toLowerCase()))
                                                    .map((journey) =>
                                                        journey.startingPoint!)
                                                    .toList();
                                              } else {
                                                filteredstartingPoints = [];
                                              }
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Select startingPoint',
                                            prefixIcon: Icon(Icons.search),
                                          ),
                                        )),
                                  ])
                            : Container(
                                padding: EdgeInsets.only(top: 30, bottom: 30),
                                child: Text(
                                  "Bus Passes are not available for the selected bus company",
                                  style: TextStyle(fontSize: 17),
                                ),
                              )
                        : SizedBox()
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
                                      selectedJourney = model.allPassJourneys
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
                if (model.allPassJourneys.any((element) =>
                        element.startingPoint == selectedstartingPoint) ||
                    selectedEnd != null)
                  SizedBox(height: 20),
                if (model.allPassJourneys.any((element) =>
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
                                8.0), // Customize border radius
                          ),
                          child: TextFormField(
                            controller: endController,
                            onChanged: (value) {
                              setState(() {
                                selectedEnd = value;
                                if (endController.text != "") {
                                  filteredDestinations = model.allPassJourneys
                                      .where((journey) => journey.destination!
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
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
                    ],
                  ),
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
                                    selectedJourney = model.allPassJourneys
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
                    ? DropdownButtonFormField2<String>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          // Add Horizontal padding using menuItemStyleData.padding so it matches
                          // the menu padding when button's width is not specified.
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          // Add more decoration..
                        ),
                        hint: const Text(
                          'Select Pass Duration',
                          style: TextStyle(fontSize: 14),
                        ),
                        items: passTypes
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
                            return 'Please select duration you want pass';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value == "Daily Pass") {
                            setState(() {
                              price = selectedJourney!.dailyPrice!;
                              validDays = 1;
                            });
                          } else if (value == "Weekly Pass") {
                            setState(() {
                              price = selectedJourney!.weeklyPrice!;
                              validDays = 7;
                            });
                          } else if (value == "Monthly Pass") {
                            setState(() {
                              price = selectedJourney!.monthlyPrice!;
                              validDays = 30;
                            });
                          }
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
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
                      )
                    : Container(),
                if (price != null)
                  Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                          color: Colors.grey[
                              200], // Set the background color for ListView
                          child: Card(
                              elevation: 4.0, // Add elevation for card effect
                              // margin: EdgeInsets.all(3.0),
                              child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "PRICE ",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text(model.valueToCurrency(price!),
                                              style: TextStyle(fontSize: 22))
                                        ],
                                      ),
                                      if (validDays == 7 || validDays == 30)
                                        Column(
                                          children: [
                                            Text("VALID FOR ",
                                                style: TextStyle(fontSize: 14)),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(validDays.toString() + " days",
                                                style: TextStyle(fontSize: 22))
                                          ],
                                        ),
                                      if (validDays == 1)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("VALID FOR ",
                                                style: TextStyle(fontSize: 16)),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(validDays.toString() + " day",
                                                style: TextStyle(fontSize: 22))
                                          ],
                                        ),
                                    ],
                                  ))))),
                selectedJourney != null
                    ? Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              color: Colors.grey[
                                  200], // Set the background color for ListView
                              child: Card(
                                  elevation:
                                      4.0, // Add elevation for card effect
                                  // margin: EdgeInsets.all(3.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            selectedJourney!.stops!.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                              title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                selectedJourney!
                                                    .stops![index].name!,
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Text(
                                                  '${selectedJourney!.stops![index].departureTime!.hour.toString().padLeft(2, '0')}:${selectedJourney!.stops![index].departureTime!.minute.toString().padLeft(2, '0')}',
                                                  style:
                                                      TextStyle(fontSize: 18))
                                            ],
                                          ));
                                        },
                                      )
                                    ],
                                  ))),
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: 20,
                ),
                selectedJourney != null
                    ? SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
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
                                  setState(() {
                                    isBusy = true;
                                  });
                                  try {
                                    Pass pass = Pass(
                                        id: model.generateGuid(),
                                        userId: model.userId,
                                        validDays: validDays,
                                        passJourney: selectedJourney,
                                        dateOfPurchase: DateTime.now(),
                                        isActive: true);

                                    await model.passesApi
                                        .passAddPost(pass: pass);
                                    List<Pass> all = model.userPasses.toList();
                                    all.add(pass);
                                    model.userPasses = all;
                                    // model.addToUserPasses(pass);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomDialog2(success: true),
                                    ).then((value) {
                                      //model.userPasses.add(pass);
                                      setState(() {
                                        isBusy = false;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  BookingScreen())));
                                    });
                                  } catch (ex) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomDialog2(success: false),
                                    ).then((value) {
                                      setState(() {
                                        isBusy = false;
                                      });
                                    });
                                  }
                                },
                                callbackUrl:
                                    "https://buspassapi.azurewebsites.net/",
                                transactionNotCompleted: () {
                                  print("Transaction Not Successful!");
                                });
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

String convertToPesewas(double price) {
  var p = price * 100;
  return p.toString();
}
