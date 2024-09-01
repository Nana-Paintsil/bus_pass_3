import 'package:bus_pass_3/Pages/Screens/PassesScreen.dart';
import 'package:bus_pass_3/Pages/Screens/TicketsScreen.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  final List<Widget> _screens = [
    TicketsScreen(),
    PassesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple.shade400,
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(48.0), // Adjust the height as needed
              child: Container(
                color: Colors
                    .white, // Set the background color of all tabs to white
                child: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Colors.black, // Set the color of the underline
                      width: 2.0, // Set the thickness of the underline
                    ),
                  ),
                  indicatorSize: TabBarIndicatorSize
                      .tab, // Ensure the indicator covers the entire tab
                  labelColor: Colors
                      .black, // Set the text color of the active tab to black
                  unselectedLabelColor: Colors
                      .black, // Set the text color of the inactive tab to black
                  tabs: [
                    Tab(child: Text("Bus Tickets")),
                    Tab(child: Text("Bus Passes")),
                  ],
                ),
              ),
            ),
            title: const Align(
                alignment: Alignment.center,
                child: Text(
                  'Booking',
                )),
          ),
          body: TabBarView(
            children: _screens,
          ),
        ),
      ),
    );
  }
}
