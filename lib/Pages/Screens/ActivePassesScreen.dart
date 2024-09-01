import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Models/Scoped_Model.dart';
import '../../Widgets/PassWidget2.dart';
import '../../api.dart';

class ActivePassesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ActivePassesScreenState();
  }
}

class _ActivePassesScreenState extends State<ActivePassesScreen> {
  List<Pass> activePasses = [];
  @override
  void initState() {
    activePasses = ScopedModel.of<MyScopedModel>(context)
        .userPasses
        .where((element) => element.isActive == false)
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: activePasses.length,
                itemBuilder: (context, index) {
                  return PassWidget(pass: activePasses[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
