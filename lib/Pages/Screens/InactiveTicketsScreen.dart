import 'package:flutter/material.dart';

class InactiveTicketsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _InactiveTicketsScreenState();
  }
}

class _InactiveTicketsScreenState extends State<InactiveTicketsScreen>{
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: 
    Column(children: [
        AppBar(title: Text("Inactive Tickets"))
      
    ],),);
  }
}
