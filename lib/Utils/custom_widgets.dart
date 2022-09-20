import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({this.check});
  var check;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Checkbox(
        value: widget.check,
        checkColor: Colors.white,
        activeColor: Colors.green,
        onChanged: (value) {
          setState(() {
            widget.check = value;
          });
        });
  }
}

class TimeField extends StatefulWidget {
  TimeField({Key? key}) : super(key: key);

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  TextEditingController timeinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 80,
      child: Center(
        child: TextField(
          readOnly: true,
          onTap: () async {
            TimeOfDay? pickedTime = await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
            );

            if (pickedTime != null) {
              print(pickedTime.format(context)); //output 10:51 PM
              DateTime parsedTime =
                  DateFormat.jm().parse(pickedTime.format(context).toString());
              //converting to DateTime so that we can further format on different pattern.
              print(parsedTime); //output 1970-01-01 22:53:00.000
              String formattedTime = DateFormat('HH:mm: a').format(parsedTime);
              print(formattedTime); //output 14:59:00
              //DateFormat() is from intl package, you can format the time on any pattern you need.

              setState(() {
                timeinput.text = formattedTime; //set the value of text field.
              });
            } else {
              print("Time is not selected");
            }
          },
          controller: timeinput,
          style: TextStyle(fontSize: 13),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 6, left: 5),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
    );
  }
}

class Datefield extends StatefulWidget {
  Datefield({Key? key}) : super(key: key);

  @override
  State<Datefield> createState() => _DatefieldState();
}

class _DatefieldState extends State<Datefield> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 80,
      child: Center(
        child: TextField(
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                    2000), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101));

            if (pickedDate != null) {
              print(
                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              print(
                  formattedDate); //formatted date output using intl package =>  2021-03-16
              //you can implement different kind of Date Format here according to your requirement

              setState(() {
                dateinput.text =
                    formattedDate; //set output date to TextField value.
              });
            } else {
              print("Date is not selected");
            }
          },
          controller: dateinput,
          style: TextStyle(fontSize: 13),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 6, left: 5),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
    );
  }
}

Widget customTextField(context,
    {controller,
    type = TextInputType.none,
    // width = 60.0,
    // height = 20.0,
    hint = ''}) {
  final size = MediaQuery.of(context).size;

  return SizedBox(
    height: 20,
    width: 60,
    child: Center(
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 13),
        keyboardType: type,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.only(bottom: 6, left: 5),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
    ),
  );
}

Widget customRow(context, {chk, text, time, date}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: Row(
          children: [
            CustomCheckBox(
              check: chk,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 100,
              child: Text(
                text,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      if (time != null) time,
      if (date != null) date,
    ],
  );
}
