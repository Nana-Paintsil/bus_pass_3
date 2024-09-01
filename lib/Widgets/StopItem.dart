import 'package:bus_pass_3/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StopItem extends StatefulWidget {
  final Stop stop;

  StopItem({required this.stop});

  @override
  _StopItemState createState() => _StopItemState();
}

class _StopItemState extends State<StopItem> {
  late DateTime _updatedArrivalTime;

  @override
  void initState() {
    super.initState();
    _updatedArrivalTime = widget.stop.expectedArrivalTime!;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.stop.name!),
      subtitle: Text(DateFormat.jm().format(_updatedArrivalTime)),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () async {
          TimeOfDay currentTime = TimeOfDay.fromDateTime(_updatedArrivalTime);
          TimeOfDay? newTime = await showTimePicker(
            context: context,
            initialTime: currentTime,
          );

          if (newTime != null) {
            setState(() {
              _updatedArrivalTime = DateTime(
                _updatedArrivalTime.year,
                _updatedArrivalTime.month,
                _updatedArrivalTime.day,
                newTime.hour,
                newTime.minute,
              );
              widget.stop.expectedArrivalTime = _updatedArrivalTime;
            });
          }
        },
      ),
    );
  }
}
