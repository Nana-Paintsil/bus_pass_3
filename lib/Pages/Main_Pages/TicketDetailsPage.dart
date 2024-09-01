import 'package:bus_pass_3/Models/Scoped_Model.dart';
import 'package:bus_pass_3/Widgets/Map.dart';
import 'package:bus_pass_3/Widgets/TicketWidget2.dart';
import 'package:bus_pass_3/api.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class TicketDetails extends StatelessWidget {
  final BusTicket pass;

  const TicketDetails({required this.pass});

  @override
  Widget build(BuildContext context) {
    debugPrint(pass.bus!.stops!.length.toString());
    return ScopedModelDescendant<MyScopedModel>(
        builder: ((context, child, model) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: model.myColor,
          centerTitle: true,
          title: Text("Ticket Details"),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TicketWidget2(pass: pass),
                SizedBox(
                  height: 30,
                ),
                Container(
                    color: Colors
                        .grey[200], // Set the background color for ListView
                    child: Card(
                        elevation: 4.0, // Add elevation for card effect
                        // margin: EdgeInsets.all(3.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15, top: 10),
                              child: Text("DEPARTURE TIMES",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600)),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: pass.bus!.stops!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      pass.bus!.stops![index].name!,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                        '${pass.bus!.stops![index].departureTime!.hour.toString().padLeft(2, '0')}:${pass.bus!.stops![index].departureTime!.minute.toString().padLeft(2, '0')}',
                                        style: TextStyle(fontSize: 18))
                                  ],
                                ));
                              },
                            ),
                            SizedBox(
                              height: 20,
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
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      padding:
                                          EdgeInsets.only(top: 13, bottom: 13)),
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MapPage(pass.bus!.stops!)));
                                  },
                                  child: Text(
                                    'View Stops In Map',
                                    style: TextStyle(
                                        color: Colors.purple.shade400,
                                        fontSize: 17),
                                  ),
                                ))
                          ],
                        ))),
              ],
            )),
      );
    }));
  }
}
