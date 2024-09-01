import 'package:flutter/material.dart';

class ActiveTicketsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActiveTicketsScreenState();
  }
}

class _ActiveTicketsScreenState extends State<ActiveTicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [AppBar(title: Text("Active Tickets"))],
      ),
    );
  }
}
