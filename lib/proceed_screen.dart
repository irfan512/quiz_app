import 'package:flutter/material.dart';
import 'package:quiz_app/Utils/main_tile.dart';
import 'package:quiz_app/quiz_screen.dart';

import 'Utils/custom_widgets.dart';
import 'Utils/proctor_tile.dart';
import 'Utils/timer_tile.dart';

class ProceedScreen extends StatefulWidget {
  @override
  State<ProceedScreen> createState() => _ProceedScreenState();
}

class _ProceedScreenState extends State<ProceedScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffe6e6e6),
      appBar: AppBar(
        backgroundColor: Color(0xff0E1B75),
        leading: Icon(Icons.menu, color: Colors.white),
        title: const Text(
          "Nous Complex",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.help_outline,
                    color: Color(0xff1687f6),
                    size: 18,
                  ),
                  Text(
                    "What do the Settings means?",
                    style: TextStyle(
                      color: Color(0xff1687f6),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),

              // Tiles

              Container(
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    border: Border.all(width: 1, color: Colors.black54),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Card(child: MainTile()),
                      Card(child: TimeTile()),
                      Card(child: ProctorTile()),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 30,
                            child: MaterialButton(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {},
                              color: Colors.green,
                              textColor: Colors.white,
                              child: const Center(
                                child: FittedBox(
                                  child: Text(
                                    "Update",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          SizedBox(
                            width: 100,
                            height: 30,
                            child: MaterialButton(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Colors.black12,
                              textColor: Colors.black,
                              child: const FittedBox(
                                fit: BoxFit.fill,
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
