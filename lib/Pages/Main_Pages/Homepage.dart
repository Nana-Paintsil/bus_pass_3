import 'package:bus_pass_3/Models/Scoped_Model.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:scoped_model/scoped_model.dart';

import '../Screens/BookingScreen.dart';
import '../Screens/HomeScreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    HomeScreen(),
    BookingScreen(),
  ];
  int _currentIndex = 0;
  bool isBusy = false;
  late LocationData location;

  @override
  void initState() {
    // Initialize filteredBuses with all buses initially
    setState(() {
      isBusy = true;
    });
    try {
      ScopedModel.of<MyScopedModel>(context).fetchUserPasses().then((value) {
        ScopedModel.of<MyScopedModel>(context).userPasses = value;
        ScopedModel.of<MyScopedModel>(context)
            .passJourneyApi
            .passJourneyGetAllPassJourneysGet(
                ScopedModel.of<MyScopedModel>(context).token!)
            .then((value) {
          ScopedModel.of<MyScopedModel>(context).allPassJourneys = value!;
          ScopedModel.of<MyScopedModel>(context)
              .busticketApi
              .busTicketGetUserBusTicketsGet(
                  userId: ScopedModel.of<MyScopedModel>(context).userId,
                  token: ScopedModel.of<MyScopedModel>(context).token)
              .then((value) {
            ScopedModel.of<MyScopedModel>(context).userTickets = value!;
            ScopedModel.of<MyScopedModel>(context)
                .tenantsApi
                .tenantsGetAllTenantsGet()
                .then((value) {
              ScopedModel.of<MyScopedModel>(context).allTenants = value!;
              setState(() {
                isBusy = false;
              });
              /*
              ScopedModel.of<MyScopedModel>(context)
                  .GetLocation()
                  .then((value) {
                location = value;
               
              });*/
            });
          });
        });
      });
    } catch (ex) {}

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScopedModelDescendant<MyScopedModel>(
          builder: (context, child, model) {
        return Scaffold(
            body: isBusy == true
                ? Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/main_background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        // Customize CircularProgressIndicator properties here
                        valueColor:
                            AlwaysStoppedAnimation<Color>(model.myColor),
                      ),
                    ),
                  )
                : PageView(
                    controller:
                        _pageController, // Use PageController for navigation
                    children: _screens,
                    onPageChanged: (index) {
                      // Update the current index when the page changes
                      // This ensures the BottomNavigationBar reflects the current screen
                      // when swiping left/right as well.
                      _currentIndex = index;
                    },
                  ),
            bottomNavigationBar: isBusy == true
                ? Container(
                    color: model.seconday, // Set the background color
                    child: Center(
                      child: CircularProgressIndicator(
                        // Customize CircularProgressIndicator properties here
                        valueColor:
                            AlwaysStoppedAnimation<Color>(model.myColor),
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: BottomNavigationBar(
                      backgroundColor: model.seconday,
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        // Navigate to the corresponding page when tapping on a tab
                        _pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      unselectedItemColor: Colors.black,
                      selectedItemColor: model.myColor,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.book), label: 'Booking'),
                      ],
                    ),
                  ));
      }),
    );
  }
}
