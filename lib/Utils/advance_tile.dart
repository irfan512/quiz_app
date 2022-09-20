import 'package:flutter/material.dart';

class Advance extends StatefulWidget {
  const Advance({Key? key}) : super(key: key);

  @override
  State<Advance> createState() => _AdvanceState();
}

class _AdvanceState extends State<Advance> {
  bool? check1 = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      textColor: Colors.black,
      iconColor: Colors.black,
      collapsedTextColor: Colors.black,
      title: Text("Advance Setting"),
      expandedAlignment: Alignment.topLeft,
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              height: 30,
              width: size.width * 0.55,
              child: TextField(
                style: TextStyle(fontSize: 13),
                keyboardType: TextInputType.name,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "FeedBack(Optional)",
                  hintStyle: TextStyle(fontSize: 13),
                  contentPadding: EdgeInsets.only(bottom: 15, left: 3),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text("Negative Points"),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              height: 20,
              width: 80,
              child: Center(
                child: TextField(
                  style: TextStyle(fontSize: 13),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 7, left: 3),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text("Cannot Skip"),
            SizedBox(
              width: 10,
            ),
            Checkbox(
                //only check box
                value: check1, //unchecked
                onChanged: (bool? value) {
                  //value returned when checkbox is clicked
                  setState(() {
                    check1 = value;
                  });
                }),
          ],
        )
      ],
    );
  }
}
