import 'package:bus_pass_3/Models/Scoped_Model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scoped_model/scoped_model.dart';

import '../api.dart';

class TicketWidget2 extends StatelessWidget {
  final BusTicket pass;

  const TicketWidget2({required this.pass});

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
    return Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: Container(
          padding: EdgeInsets.all(20),
          height: 140,
          decoration: BoxDecoration(
            color: ScopedModel.of<MyScopedModel>(context).seconday,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
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
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(child: buildCellContent(2)),
                  Expanded(child: buildCellContent(3)),
                ],
              ),
            ],
          ),
        ));
  }
}

String formatDate(DateTime dateTime) {
  final DateFormat formatter = DateFormat('E, d MMM yy');
  return formatter.format(dateTime);
}
