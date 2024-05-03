import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_widget_app/widget/alertBox.dart';

class DateTimePage extends StatefulWidget {
  const DateTimePage({super.key});

  @override
  State<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  String date1 = "Date1";
  String date2 = "Date2";

  Future<DateTime?> getDateInput() async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2010),
        lastDate: DateTime(2030),
        initialDate: DateTime.now());

    return date;
  }

  String dateFormat(DateTime date) {
     String month = date.month.toString().padLeft(2, '0'); // Ensure two digits for month
      String day = date.day.toString().padLeft(2, '0');
      return "${date.year}-$month-$day";
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: Text(
                      "Date Range",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    width: double.infinity, // Expand to fill the width
                    height: 50,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async{
        
                      final date = await getDateInput();
                      if(date == null){
                        return;
                      }
                      displayAlert(context,"Alert","Please Define the action after selecting the date\n${dateFormat(date)}");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // No border radius
                      ),
                    ),
                    child: Container(
                      width: double.infinity, // Expand to fill the width
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        date1,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // No border radius
                      ),
                    ),
                    child: Container(
                      width: double.infinity, // Expand to fill the width
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        date2,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
