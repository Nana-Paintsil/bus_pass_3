import 'package:bus_pass_3/Pages/Main_Pages/TicketDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api.dart';

class TicketWidget extends StatelessWidget {
  final BusTicket pass;
  final List<Stop> stops;

  const TicketWidget({required this.pass, required this.stops});

  Widget buildCellContent(int index) {
    // Create the content for each grid cell based on the index
    if (index == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "FROM",
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            pass.startingPoint!,
            style: TextStyle(fontSize: 20),
          )
        ],
      );
    }
    if (index == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TO",
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            pass.endingPoint!,
            style: TextStyle(fontSize: 20),
          )
        ],
      );
    }
    if (index == 2) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SEAT NO",
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            pass.seatNo!,
            style: TextStyle(fontSize: 20),
          )
        ],
      );
    }
    if (index == 3) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* Text(
                        "PRICE",
                        style: TextStyle(
                            fontSize: 11, color: Colors.grey.shade600),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        pass.price!.toString(),
                        style: TextStyle(fontSize: 20),
                      )*/
          Text(
            "BUS REG. NO",
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            pass.bus!.regNo.toString(),
            style: TextStyle(fontSize: 20),
          )
        ],
      );
    }
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    pass.bus!.stops = stops;
    return Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => TicketDetails(pass: pass))));
            },
            child: Card(
                elevation: 4, // Adjust the elevation value as needed
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/card_background.png'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: buildCellContent(0)),
                          Expanded(child: buildCellContent(1)),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 20,
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 18,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(child: buildCellContent(2)),
                          Expanded(child: buildCellContent(3)),
                        ],
                      ),
                    ],
                  ),
                ))));
  }
}

String formatDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat('E, d MMM yy');
  return formatter.format(dateTime);
}
