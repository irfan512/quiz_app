import 'package:flutter/material.dart';
import 'package:quiz_app/Utils/custom_widgets.dart';
import 'package:quiz_app/proceed_screen.dart';

import 'Utils/advance_tile.dart';
import 'Utils/timer_tile.dart';

var value1 = false;

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _count = 1;
  String dropdownvalue = 'MCQS';
  String dropdownvalue1 = 'none';
  var val;
  var val2;
  bool? check1 = false;
  var items = [
    'MCQS',
    'Short Text',
    'MCA',
    'Cloze',
    'Match',
  ];

  var items1 = [
    'none',
    'image',
    'audio',
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<Widget> _contatos =
        new List.generate(_count, (int i) => questionContainer());

    return SafeArea(
      child: Scaffold(
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
              EdgeInsets.symmetric(horizontal: size.width * 0.10, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.25,
                      child: Text(
                        "Socratese Quiz",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Row(children: [
                        TextButton.icon(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                primary: Color.fromRGBO(0, 0, 0, 1)),
                            icon: const Icon(
                              Icons.save_alt_outlined,
                              size: 16,
                            ),
                            label: const Text("Save")),
                        SizedBox(
                          width: 100,
                          child: MaterialButton(
                            elevation: 0,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProceedScreen()));
                            },
                            color: Colors.green,
                            textColor: Colors.white,
                            child: FittedBox(
                              child: const Text(
                                "SAVE & PROCEED",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),

// Question Container
                Column(
                  children: _contatos,
                ),

                // IconButton Row

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: addNewContainer,
                        icon: Icon(
                          Icons.note_add_outlined,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () {
                          _count > 1
                              ? setState(() {
                                  _count = _count - 1;
                                })
                              : print("No Delete");
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black,
                        )),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.download,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                //  Buttom Bottons

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 30,
                      child: MaterialButton(
                        onPressed: addNewContainer,
                        color: Color(0xffe6e6e6),
                        textColor: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.note_add_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add Question",
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    SizedBox(
                      width: 120,
                      height: 30,
                      child: MaterialButton(
                        onPressed: () {},
                        color: Color(0xff0E1B75),
                        textColor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.save_alt_outlined,
                              size: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "SAVE",
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addNewContainer() {
    setState(() {
      _count = _count + 1;
    });
  }

  Widget questionContainer() {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffffffff),
            border: Border.all(width: 1, color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      width: 120,
                      height: 35,
                      child: Row(
                        children: [
                          Icon(
                            Icons.quiz_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Question 1"),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 35,
                      child: Row(
                        children: [
                          Container(
                            height: 25,
                            width: 100,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isDense: true,
                                isExpanded: true,
                                value: dropdownvalue,
                                icon: Icon(Icons.keyboard_arrow_down),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                      value: items, child: Text(items));
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.help_outline,
                            color: Color(0xff1687f6),
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 35,
                      child: Row(
                        children: [
                          Text("Points"),
                          SizedBox(
                            width: 10,
                          ),
                          customTextField(
                            context,
                            type: TextInputType.number,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const FittedBox(
                    child: Text(
                      "Question Duration",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  customTextField(
                    context,
                    type: TextInputType.number,
                    //  width: 60,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
                width: size.width * 0.6,
                child: TextField(
                  style: TextStyle(fontSize: 13),
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "Question text",
                    hintStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.only(bottom: 13, left: 3),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Media"),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 25,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isDense: true,
                          isExpanded: true,
                          value: dropdownvalue1,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: items1.map((String items1) {
                            return DropdownMenuItem(
                                value: items1, child: Text(items1));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue1 = newValue!;
                            });
                          },
                        ),
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
                  Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value;
                        print(val);
                      });
                    },
                    activeColor: Colors.green,
                    toggleable: true,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  customTextField(
                    context,
                    // width: 120,
                    hint: "Option 1",
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: val2,
                    onChanged: (value) {
                      setState(() {
                        val2 = value;
                        print(val2);
                      });
                    },
                    activeColor: Colors.green,
                    toggleable: true,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  customTextField(
                    context,
                    // width: 120,
                    hint: "Option 2",
                  ),
                ],
              ),

              // tile
              Advance(),
            ],
          ),
        ),
      ),
    );
  }
}
