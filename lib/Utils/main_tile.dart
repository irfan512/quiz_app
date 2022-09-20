import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class MainTile extends StatefulWidget {
  @override
  State<MainTile> createState() => _MainTileState();
}

class _MainTileState extends State<MainTile> {
  bool? check1 = false;
  bool? check2 = false;
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
      initiallyExpanded: true,
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.all(5),
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
        "Main",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      expandedAlignment: Alignment.center,
      // onExpansionChanged: ,
      expandedCrossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CustomCheckBox(check: check1),
                  title: Text("Enable Timer"),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 30,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CustomCheckBox(check: check2),
                  title: const Text("Enable Proctor"),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Maximum Attempts"),
                  const SizedBox(
                    width: 10,
                  ),
                  customTextField(
                    context,
                    type: TextInputType.number,
                    //  width: 100
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Test Type:"),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Socratese Quiz"),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 30,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              onPressed: () {},
                              color: Color(0xff1687f6),
                              textColor: Colors.white,
                              child: const Center(
                                child: FittedBox(
                                  child: Text(
                                    "Edit Test",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 100,
                            height: 30,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              onPressed: () {},
                              color: Color(0xff1687f6),
                              textColor: Colors.white,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  "Perview Test",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text("Test Title"),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 30,
                    width: size.width * 0.6,
                    child: TextField(
                      style: TextStyle(fontSize: 13),
                      keyboardType: TextInputType.name,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
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
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Test Link"),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 30,
                        width: size.width * 0.6,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: Center(
                          child: Text(
                            "https://www.autoproctor.co/test-admin/soc-tests/faa-sho-kbi/settings/",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        // width: 50,
                        height: 30,
                        child: MaterialButton(
                          onPressed: () {},
                          color: Color(0xff1687f6),
                          textColor: Colors.white,
                          child: const Text(
                            "Copy Link",
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
