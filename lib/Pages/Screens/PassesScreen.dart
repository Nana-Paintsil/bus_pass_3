import 'package:bus_pass_3/Widgets/PassWidget2.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Models/Scoped_Model.dart';
import '../../api.dart';
import '../Main_Pages/PurchaseBusPassPage.dart';

class PassesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActivePassesScreenState();
  }
}

class _ActivePassesScreenState extends State<PassesScreen> {
  List<Pass> activePasses = [];
  List<Pass> inactivePasses = [];
  @override
  void initState() {
    activePasses = ScopedModel.of<MyScopedModel>(context)
        .userPasses
        .where((element) => element.isActive == true)
        .toList();
    inactivePasses = ScopedModel.of<MyScopedModel>(context)
        .userPasses
        .where((element) => element.isActive == false)
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
                  itemCount: activePasses.length,
                  itemBuilder: (context, index) {
                    return PassWidget(pass: activePasses[index]);
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: inactivePasses.length,
                  itemBuilder: (context, index) {
                    return PassWidget(pass: inactivePasses[index]);
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
                            builder: ((context) => PurchaseBusPassPage())));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ScopedModel.of<MyScopedModel>(context).myColor,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  ),
                  child: Text('Purchase Bus Pass',
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
