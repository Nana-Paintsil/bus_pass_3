import 'package:bus_pass_3/Pages/Main_Pages/PurchaseTicketPage.dart';
import 'package:bus_pass_3/Widgets/TicketWidget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../Models/Scoped_Model.dart';
import '../../api.dart';

class TicketsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActivePassesScreenState();
  }
}

class _ActivePassesScreenState extends State<TicketsScreen> {
  List<BusTicket> userTickets = [];
  @override
  void initState() {
    userTickets = ScopedModel.of<MyScopedModel>(context)
        .userTickets
        .where((element) => element.isActive == true)
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(top: 15, bottom: 0, left: 20, right: 20),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      ScopedModel.of<MyScopedModel>(context).userTickets.length,
                  itemBuilder: (context, index) {
                    return TicketWidget(
                      pass: ScopedModel.of<MyScopedModel>(context)
                          .userTickets[index],
                      stops: ScopedModel.of<MyScopedModel>(context)
                          .userTickets[index]
                          .bus!
                          .stops!,
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => PurchaseTicketPage())));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade400,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  ),
                  child: Text('Purchase Bus Ticket',
                      style: TextStyle(
                        fontSize: 17,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
