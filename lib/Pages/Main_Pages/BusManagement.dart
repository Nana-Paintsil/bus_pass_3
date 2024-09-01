import 'package:bus_pass_3/Widgets/CustomDia.dart';
import 'package:bus_pass_3/Widgets/CustomDia2.dart';
import 'package:bus_pass_3/Widgets/StopItem.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Models/Scoped_Model.dart';
import '../../api.dart';

class JourneyScreen extends StatefulWidget {
  @override
  _JourneyScreenState createState() => _JourneyScreenState();
}

class _JourneyScreenState extends State<JourneyScreen> {
  Journey? selectedJourney;
  Bus? selectedBus;
  bool isBusy = false;
  bool isInitialBusy = false;
  bool busFullBusy = false;
  bool busResetting = false;
  int passengerCount = 0;
  @override
  void initState() {
    setState(() {
      isInitialBusy = true;
    });

    ScopedModel.of<MyScopedModel>(context)
        .busesApi
        .busesGetAllBusesGet(ScopedModel.of<MyScopedModel>(context).token!)
        .then((value) {
      ScopedModel.of<MyScopedModel>(context).buses = value!;
      setState(() {
        isInitialBusy = false;
      });
    });
    setState(() {
      isInitialBusy = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyScopedModel>(
        builder: ((context, child, model) {
      return isInitialBusy == true
          ? Container(
              width: double.infinity,
              height: double.infinity,
              color: model.seconday, // Set the background color
              child: Center(
                child: CircularProgressIndicator(
                  // Customize CircularProgressIndicator properties here
                  valueColor: AlwaysStoppedAnimation<Color>(model.myColor),
                ),
              ),
            )
          : Scaffold(
              backgroundColor: model.primary,
              appBar: AppBar(
                centerTitle: true,
                elevation: 2,
                backgroundColor: Colors.purple.shade400,
                leading: SizedBox(),
                title: Text(
                  'Bus Management',
                  style: TextStyle(color: Colors.white),
                ),
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
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "BUS REGISTRATION NO",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          DropdownButtonFormField2<Bus>(
                            value: selectedBus,
                            isExpanded: true,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                border: InputBorder.none),
                            onChanged: (Bus? newValue) {
                              setState(() {
                                selectedBus = newValue;
                              });
                            },
                            items: model.buses.map((Bus bus) {
                              return DropdownMenuItem<Bus>(
                                value: bus,
                                child: Text('${bus.regNo}'),
                              );
                            }).toList(),
                            hint: const Text(
                              'Select Bus',
                              style: TextStyle(fontSize: 14),
                            ),
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
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
                          ),
                          if (selectedBus != null)
                            if (selectedBus!.inTransit == false)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "TRIP",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  DropdownButtonFormField2<Journey>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 10),
                                        border: InputBorder.none),
                                    items: model.allJourneys
                                        .map((Journey journey) {
                                      return DropdownMenuItem<Journey>(
                                        value: journey,
                                        child: Text(
                                            '${journey.startingPoint} to ${journey.destination}'),
                                      );
                                    }).toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Select trip you are managing';
                                      }
                                      return null;
                                    },
                                    onChanged: (Journey? newValue) {
                                      setState(() {
                                        selectedJourney = newValue;
                                        selectedJourney!.activeBus =
                                            selectedBus;
                                      });
                                    },
                                    hint: const Text(
                                      'Select Trip',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black)),
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                  ),
                                ],
                              )
                            else
                              Column(
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(30),
                                      child: Text(
                                          'SELECTED BUS IS NOT AVAILABLE')),
                                  SizedBox(
                                      width: 150,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.only(
                                                top: 13, bottom: 13)),
                                        onPressed: () async {
                                          setState(() {
                                            busResetting = true;
                                          });
                                          var index =
                                              model.buses.indexOf(selectedBus!);

                                          setState(() {
                                            selectedBus!.inTransit = false;
                                            selectedBus!.isBeingLoaded = false;
                                            selectedBus!.currentCapacity = 0;
                                            model.buses[index].inTransit =
                                                false;
                                            model.buses[index].stops =
                                                selectedJourney!.stops;
                                            model.buses[index].isBeingLoaded =
                                                false;
                                          });

                                          await model.busesApi.busesUpdatePut(
                                              bus: model.buses[index]);
                                          setState(() {
                                            busResetting = false;
                                          });
                                        },
                                        child: Text(
                                          'Bus Now Available',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      )),
                                ],
                              ),
                          if (selectedJourney != null)
                            if (selectedJourney!.activeBus != null)
                              if (selectedBus!.inTransit == false)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Text(
                                            'PASSENGER COUNT: ${selectedBus!.currentCapacity}')),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all()),
                                            child: IconButton(
                                              iconSize: 25,
                                              onPressed: () {
                                                setState(() {
                                                  if (passengerCount > 1) {
                                                    passengerCount =
                                                        passengerCount - 1;
                                                  }
                                                });
                                              },
                                              icon: Icon(Icons.remove),
                                            )),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        width: 1,
                                                        color: Colors.black),
                                                    top: BorderSide(
                                                        width: 1,
                                                        color: Colors.black))),
                                            child: Center(
                                                child:
                                                    Text('${passengerCount}'))),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all()),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (passengerCount <
                                                      selectedBus!
                                                          .maxCapacity!) {
                                                    passengerCount =
                                                        passengerCount + 1;
                                                  }
                                                });
                                              },
                                              icon: Icon(Icons.add),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    if (selectedJourney != null)
                                      Card(
                                          color: model.seconday,
                                          elevation:
                                              4.0, // Add elevation for card effect
                                          // margin: EdgeInsets.all(3.0),
                                          child: Column(children: [
                                            Container(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.all(10),
                                                child: Text("  STOPS",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors
                                                            .grey.shade600))),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: selectedJourney!
                                                  .stops!.length,
                                              itemBuilder: (context, index) {
                                                return StopItem(
                                                    stop: selectedJourney!
                                                        .stops![index]);
                                              },
                                            ),
                                          ])),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.purple
                                                        .shade400), // Change the border color here
                                                borderRadius: BorderRadius.circular(
                                                    0), // Adjust the border radius as needed
                                              ),
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 0,
                                              padding: EdgeInsets.only(
                                                  top: 13, bottom: 13)),
                                          onPressed: () async {
                                            setState(() {
                                              isBusy = true;
                                            });

                                            var result =
                                                await model.fetchJourneyDetails(
                                                    selectedJourney!.id
                                                        .toString());
                                            if (result.activeBus != null) {
                                              setState(() {
                                                selectedBus!.currentCapacity =
                                                    result.activeBus!
                                                        .currentCapacity;
                                              });
                                              /*setState(() {
                                                  // selectedJourney = result;
                                                  selectedBus!.currentCapacity =
                                                      result.activeBus!
                                                          .currentCapacity;
                                                });*/
                                              if (result.activeBus!
                                                      .currentCapacity ==
                                                  result
                                                      .activeBus!.maxCapacity) {
                                                var index = model.buses
                                                    .indexOf(selectedBus!);
                                                model.buses[index].inTransit =
                                                    true;
                                                model.buses[index]
                                                    .isBeingLoaded = false;
                                                model.buses[index]
                                                        .currentCapacity =
                                                    model.buses[index]
                                                        .maxCapacity;
                                                model.buses[index].stops =
                                                    result.stops;
                                                result.activeBus = null;
                                                await model
                                                    .updateJourney(result);
                                                await model.busesApi
                                                    .busesUpdatePut(
                                                        bus:
                                                            model.buses[index]);
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext
                                                          context) =>
                                                      CustomDia(success: false),
                                                ).then((value) {
                                                  if (selectedBus!
                                                          .currentCapacity! ==
                                                      selectedBus!
                                                          .maxCapacity!) {
                                                    model.buses[index]
                                                        .inTransit = true;
                                                    model.buses[index]
                                                        .isBeingLoaded = false;
                                                    setState(() {
                                                      selectedBus!.inTransit =
                                                          true;
                                                      selectedBus!
                                                              .isBeingLoaded =
                                                          false;
                                                    });
                                                  }
                                                  setState(() {
                                                    isBusy = false;
                                                  });
                                                });
                                              } else {
                                                selectedJourney!.activeBus =
                                                    selectedBus;
                                                var index = model.buses.indexOf(
                                                    selectedJourney!
                                                        .activeBus!);
                                                model.buses[index]
                                                        .currentCapacity =
                                                    selectedBus!
                                                        .currentCapacity;

                                                model.buses[index].stops =
                                                    selectedJourney!.stops!;
                                                selectedJourney!.activeBus =
                                                    selectedBus;
                                                if (selectedJourney!.activeBus!
                                                            .currentCapacity! +
                                                        passengerCount <=
                                                    selectedJourney!.activeBus!
                                                        .maxCapacity!) {
                                                  selectedJourney!.activeBus!
                                                          .currentCapacity =
                                                      selectedJourney!
                                                              .activeBus!
                                                              .currentCapacity! +
                                                          passengerCount;
                                                  await model.updateJourney(
                                                      selectedJourney!);
                                                  await model.busesApi
                                                      .busesUpdatePut(
                                                          bus: model
                                                              .buses[index]);
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        CustomDia(
                                                            success: true),
                                                  ).then((value) {
                                                    if (selectedBus!
                                                            .currentCapacity! ==
                                                        selectedBus!
                                                            .maxCapacity!) {
                                                      model.buses[index]
                                                          .inTransit = true;
                                                      model.buses[index]
                                                              .isBeingLoaded =
                                                          false;
                                                      setState(() {
                                                        passengerCount = 0;
                                                        selectedBus!.inTransit =
                                                            true;
                                                        selectedBus!
                                                                .isBeingLoaded =
                                                            false;
                                                        isBusy = false;
                                                      });
                                                    }
                                                    setState(() {
                                                      isBusy = false;
                                                    });
                                                  });
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        CustomDia2(
                                                            success: false),
                                                  ).then((value) {
                                                    setState(() {
                                                      isBusy = false;
                                                    });
                                                  });
                                                }
                                              }
                                            } else {
                                              selectedJourney!.activeBus =
                                                  selectedBus;
                                              var index = model.buses.indexOf(
                                                  selectedJourney!.activeBus!);

                                              model.buses[index].isBeingLoaded =
                                                  true;
                                              model.buses[index]
                                                      .currentCapacity =
                                                  selectedBus!.currentCapacity;

                                              model.buses[index].stops =
                                                  selectedJourney!.stops!;
                                              selectedJourney!.activeBus =
                                                  selectedBus;

                                              await model.updateJourney(
                                                  selectedJourney!);
                                              await model.busesApi
                                                  .busesUpdatePut(
                                                      bus: model.buses[index]);
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    CustomDia(success: true),
                                              ).then((value) {
                                                if (selectedBus!
                                                        .currentCapacity! ==
                                                    selectedBus!.maxCapacity!) {
                                                  model.buses[index].inTransit =
                                                      true;
                                                  model.buses[index]
                                                      .isBeingLoaded = false;
                                                  setState(() {
                                                    selectedBus!.inTransit =
                                                        true;
                                                    selectedBus!.isBeingLoaded =
                                                        false;
                                                  });
                                                }
                                                setState(() {
                                                  isBusy = false;
                                                  selectedBus!.currentCapacity =
                                                      selectedBus!
                                                              .currentCapacity! +
                                                          passengerCount;
                                                  passengerCount = 0;
                                                });
                                              });
                                            }
                                          },
                                          child: isBusy == true
                                              ? SizedBox(
                                                  height: 25,
                                                  width: 30,
                                                  child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                    color:
                                                        Colors.purple.shade400,
                                                  )),
                                                )
                                              : Text(
                                                  'Save',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .purple.shade400,
                                                      fontSize: 17),
                                                ),
                                        )) /*
                                          SizedBox(
                                              width: 150,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.purple.shade400,
                                                    padding: EdgeInsets.only(
                                                        top: 13, bottom: 13)),
                                                onPressed: () async {
                                                  setState(() {
                                                    busFullBusy = true;
                                                  });
                                                  var index = model.buses
                                                      .indexOf(selectedJourney!
                                                          .activeBus!);
                                                  model.buses[index].inTransit =
                                                      true;
                                                  model.buses[index]
                                                      .isBeingLoaded = false;
                                                  model.buses[index]
                                                          .currentCapacity =
                                                      model.buses[index]
                                                          .maxCapacity;

                                                  selectedJourney!.activeBus =
                                                      null;
                                                  await model.updateJourney(
                                                      selectedJourney!);
                                                  await model.busesApi
                                                      .busesUpdatePut(
                                                          bus: model
                                                              .buses[index]);
                                                  setState(() {
                                                    busFullBusy = false;
                                                  });
                                                },
                                                child: busFullBusy == true
                                                    ? CircularProgressIndicator(
                                                        color: Colors.white,
                                                      )
                                                    : Text(
                                                        'Bus Full',
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                              )),
                                        ],
                                      )*/
                                    /*
                              ElevatedButton(
                                onPressed: () async {
                                  selectedJourney!.activeBus!.currentCapacity =
                                      0;
                                  selectedJourney!.activeBus!.inTransit = false;
                                  setState(() {
                                    isBusy = true;
                                  });
                                  await model.updateJourney(selectedJourney!);
                                  setState(() {
                                    isBusy = false;
                                  });
                                },
                                child: Text('Bus Reached Destination'),
                              ),*/
                                  ],
                                )
                        ])),
                  )));
    }));
  }
}
