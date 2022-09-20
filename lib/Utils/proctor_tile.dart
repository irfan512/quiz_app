import 'package:flutter/material.dart';
import 'package:quiz_app/Utils/custom_widgets.dart';

class ProctorTile extends StatefulWidget {
  @override
  State<ProctorTile> createState() => _ProctorTileState();
}

class _ProctorTileState extends State<ProctorTile> {
  var var1 = true;
  var var2 = true;
  var var3 = true;
  var var4 = true;
  var var5 = false;
  var var6 = true;
  var var7 = true;
  bool? expand = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (val) {
        setState(() {
          expand = val;
        });
      },
      leading: expand == false
          ? Icon(
              Icons.add_circle,
              size: 21,
            )
          : Icon(Icons.remove_circle),
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.all(5),
      collapsedIconColor: Colors.grey,
      iconColor: Colors.black,
      textColor: Colors.black,
      title: Text(
        "Proctor",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Tracking",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [CustomCheckBox(check: var1), Text("Tab Switching")],
            ),
            Row(
              children: [CustomCheckBox(check: var2), Text("Camera")],
            ),
            Row(
              children: [CustomCheckBox(check: var3), Text("MicroPhone")],
            ),
            Row(
              children: [CustomCheckBox(check: var4), Text("Photos at Random")],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Before Test",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [CustomCheckBox(check: var5), Text("Capture Face")],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Communication",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                CustomCheckBox(check: var6),
                Text("Me after the Test")
              ],
            ),
            Row(
              children: [
                CustomCheckBox(check: var7),
                Text("User during the Test")
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
