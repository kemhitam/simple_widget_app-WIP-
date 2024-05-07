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

  DateTime? startDate1;
  DateTime? endDate1;
  DateTime? startDate2;
  DateTime? endDate2;

  Future<DateTime?> getDateInput() async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2010),
        lastDate: DateTime(2030),
        initialDate: DateTime.now());

    return date;
  }

  String dateFormat(DateTime date) {
    String month =
        date.month.toString().padLeft(2, '0'); // Ensure two digits for month
    String day = date.day.toString().padLeft(2, '0');
    return "${date.year}-$month-$day";
  }

  Future<TimeOfDay?> getTime(TimeOfDay? oldTime) async {
    final time = await showTimePicker(
      context: context,
      initialTime: oldTime ?? TimeOfDay.now(),
    );
    return time;
  }

  int timeValidation(TimeOfDay timeStart, TimeOfDay timeEnd) {
    if (timeStart.hour < timeEnd.hour) {
      return -1;
    } else if (timeStart.hour > timeEnd.hour)
      return 1;
    else {
      return 0;
    }
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
                    child: const Text(
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
                    onPressed: () async {
                      final date = await getDateInput();
                      if (date == null) {
                        return;
                      }
                      if (endDate1 != null) {
                        if (endDate1!.isBefore(date)) {
                          displayAlert(context, "Alert",
                              "Please don't pick End-Date Earlier than Start-Date");
                          setState(() {
                            startDate1 = date;
                            endDate1 = date;
                          });
                        }
                      }
                      setState(() {
                        startDate1 = date;
                      });
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
                        startDate1 == null
                            ? "Start Date"
                            : dateFormat(startDate1!),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final date = await getDateInput();
                      if (date == null) {
                        return;
                      }
                      if (startDate1 != null) {
                        if (startDate1!.isAfter(date)) {
                          displayAlert(
                            context,
                            "Alert",
                            "The end date cannot earlier than start date",
                          );
                          setState(() {
                            startDate1 = date;
                            endDate1 = date;
                          });
                        }
                      }
                      setState(() {
                        endDate1 = date;
                      });
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
                        endDate1 == null ? "End Date" : dateFormat(endDate1!),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            //second
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: const Text(
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
                    onPressed: () async {
                      final date = await getDateInput();
                      if (date == null) {
                        return;
                      }
                      if (endDate1 != null) {
                        if (endDate2!.isBefore(date)) {
                          displayAlert(context, "Alert",
                              "Please don't pick End-Date Earlier than Start-Date");
                          setState(() {
                            startDate2 = date;
                            endDate2 = date;
                          });
                        }
                      }
                      setState(() {
                        startDate2 = date;
                      });
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
                        startDate2 == null
                            ? "Start Date"
                            : dateFormat(startDate2!),
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final date = await getDateInput();
                      if (date == null) {
                        return;
                      }
                      if (startDate2 != null) {
                        if (startDate2!.isAfter(date)) {
                          displayAlert(
                            context,
                            "Alert",
                            "The end date cannot earlier than start date",
                          );
                          setState(() {
                            startDate2 = date;
                            endDate2 = date;
                          });
                        }
                      }
                      setState(() {
                        endDate2 = date;
                      });
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
                        endDate2 == null ? "End Date" : dateFormat(endDate2!),
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
