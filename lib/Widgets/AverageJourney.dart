import 'package:bus_pass_3/Models/Scoped_Model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../Models/AverageJourney.dart';

class AverageJourney extends StatelessWidget {
  final AverageJourneyModel model;

  AverageJourney({required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'FROM:',
                          style: TextStyle(color: Colors.grey.shade600),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      model.startingPoint,
                      style: TextStyle(fontSize: 19),
                    )
                  ],
                ),
                Transform.translate(
                    offset: Offset(0, 15),
                    child: Text(
                      ScopedModel.of<MyScopedModel>(context)
                          .valueToCurrency(model.price),
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        'TO:',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(model.destination, style: TextStyle(fontSize: 19))
                  ],
                ),
                SizedBox()
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
