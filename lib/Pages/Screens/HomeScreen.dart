import 'package:bus_pass_3/Models/Scoped_Model.dart';
import 'package:bus_pass_3/Pages/Authentication/LoginPage.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Models/AverageJourney.dart';
import '../../Widgets/AverageJourney.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  List<AverageJourneyModel> averages = [];
  @override
  void initState() {
    _calculateAverageJourneys();
    super.initState();
  }

  void _calculateAverageJourneys() {
    Map<String, Map<String, List<double>>> groupedJourneys = {};

    for (var journey in ScopedModel.of<MyScopedModel>(context).allJourneys) {
      if (!groupedJourneys.containsKey(journey.startingPoint)) {
        groupedJourneys[journey.startingPoint!] = {};
      }

      if (!groupedJourneys[journey.startingPoint]!
          .containsKey(journey.destination)) {
        groupedJourneys[journey.startingPoint]![journey.destination!] = [];
      }

      groupedJourneys[journey.startingPoint]![journey.destination]!
          .add(journey.price!);
    }

    groupedJourneys.forEach((startingPoint, destinations) {
      destinations.forEach((destination, prices) {
        double averagePrice = prices.reduce((a, b) => a + b) / prices.length;
        averages.add(
          AverageJourneyModel(
            startingPoint: startingPoint,
            destination: destination,
            price: averagePrice,
          ),
        );
      });
    });
  }

/*
  void _filterBuses(String keyword) {
    setState(() {
      _filteredBuses = ScopedModel.of<MyScopedModel>(context)
          .stops
          .where((stop) =>
              stop.id.toString().toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyScopedModel>(
        builder: (context, child, model) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    customButton: const Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.white,
                    ),
                    items: [
                      ...MenuItems.firstItems.map(
                        (item) => DropdownMenuItem<MenuItem>(
                          value: item,
                          child: MenuItems.buildItem(item),
                        ),
                      ),
                      const DropdownMenuItem<Divider>(
                          enabled: false, child: Divider()),
                      ...MenuItems.secondItems.map(
                        (item) => DropdownMenuItem<MenuItem>(
                          value: item,
                          child: MenuItems.buildItem(item),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      MenuItems.onChanged(context, value! as MenuItem);
                    },
                    dropdownStyleData: DropdownStyleData(
                      width: 160,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      offset: const Offset(0, 0),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      customHeights: [
                        ...List<double>.filled(MenuItems.firstItems.length, 48),
                        8,
                        ...List<double>.filled(
                            MenuItems.secondItems.length, 48),
                      ],
                      padding: const EdgeInsets.only(left: 16, right: 16),
                    ),
                  ),
                ),
              )
            ],
            title: Text(
              "Home",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.purple.shade400.withOpacity(0.8),
          ),
          body: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/main_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 20, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Good Day, ",
                                    style: TextStyle(fontSize: 24)),
                                Text("${model.authenticatedUser!.firstName!}",
                                    style: TextStyle(fontSize: 24)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //  Text("Let's", style: TextStyle(fontSize: 24)),
                            Text("Let's Arrange Your Bus Travel",
                                style: TextStyle(fontSize: 27)),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("  AVERAGE PRICING",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600)),
                                ],
                              ),
                              //  Text("Let's", style: TextStyle(fontSize: 24)),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: averages.length,
                                itemBuilder: (context, index) {
                                  return AverageJourney(model: averages[index]);
                                },
                              ),
                            ],
                          )),
                    ),
                  ]),
                ),
                /* Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: model.seconday,
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: TextFormField(
                          onChanged: _filterBuses,
                          decoration: InputDecoration(
                            icon: Icon(Icons.search),
                            iconColor: Colors.black,
                            hintText: 'Search Location...',
                          ),
                        ),
                    SizedBox(),
               Container(
                      child: MapPage(model.allStops, location),
                      height: 350,
                      decoration: BoxDecoration(color: model.primary)),*/
              ]),
            ),
          ));
    });
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [settings];
  static const List<MenuItem> secondItems = [logout];
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.black, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.settings:
        //Do something
        break;

      case MenuItems.logout:
        _showLogoutConfirmationDialog(context);
        break;
    }
  }
}

Future<void> _showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // Prevent user from tapping outside to close
    builder: (BuildContext context1) {
      return AlertDialog(
        title: Text('Confirm Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context1).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(context1).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
              // Close the dialog
            },
          ),
        ],
      );
    },
  );
}
