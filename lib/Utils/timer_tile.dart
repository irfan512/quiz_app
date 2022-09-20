import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_app/Utils/custom_widgets.dart';

class TimeTile extends StatefulWidget {
  @override
  State<TimeTile> createState() => _TimeTileState();
}

class _TimeTileState extends State<TimeTile> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  var chk1 = false;
  var chk2 = false;

  var chk3 = false;
  var chk4 = false;
  var chk5 = false;
  var chk6 = false;
  bool? expand = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ExpansionTile(
      onExpansionChanged: (val) {
        setState(() {
          expand = val;
        });
      },
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.all(25),
      leading: expand == false
          ? Icon(
              Icons.add_circle,
              size: 21,
            )
          : Icon(Icons.remove_circle),
      collapsedIconColor: Colors.grey,
      iconColor: Colors.black,
      textColor: Colors.black,
      title: Text(
        "Timer",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      children: [
        Row(
          children: [
            Text(
              "Duration Minutes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            customTextField(
              context,
              type: TextInputType.number,
              controller: dateinput,
              // width: size.width * 2
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        customRow(
          context,
          chk: chk1,
          text: "Start Date",
          date: Datefield(),
        ),
        customRow(
          context,
          chk: chk2,
          text: "Start Time",
          time: TimeField(),
        ),
        customRow(
          context,
          chk: chk3,
          text: "End Date",
          date: Datefield(),
        ),
        customRow(
          context,
          chk: chk4,
          text: "Can't Start After",
          time: TimeField(),
        ),
        customRow(
          context,
          chk: chk5,
          text: "Must Submit By",
          time: TimeField(),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CustomCheckBox(
              check: chk6,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Auto Submission",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            )
          ],
        )
      ],
    );
  }
}
