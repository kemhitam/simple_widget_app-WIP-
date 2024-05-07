import 'package:flutter/material.dart';
import 'package:simple_widget_app/page/page1_TNC.dart';
import 'package:simple_widget_app/page/page2_DateTime.dart';
import 'package:simple_widget_app/page/page3_payment.dart';
import 'package:simple_widget_app/page/page4_todolist.dart';
import 'package:simple_widget_app/page/page5_buttonAlign.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget? content;
  String title = 'Flyout Layout Example';
  String? name;
  String? age;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool submited = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Term And Condition'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = const TermAndConditionPage();
                  title = "Term And Condition";
                });
              },
            ),
            ListTile(
              title: const Text('DateTime'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = const DateTimePage();
                  title = "Date Validation";
                });
              },
            ),
            ListTile(
              title: const Text('Text Formatting'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = const AmountPage();
                  title = "Price Formatting";
                });
              },
            ),
            ListTile(
              title: const Text('To Do List'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = const ToDoListPage();
                  title = "To Do List";
                });
              },
            ),
            ListTile(
              title: const Text('Button Alignment'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  content = const ButtonAlignmentPage();
                  title = "Button Alignment";
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: (content == null)
            ? OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        title: const Text("Enter Your Information!"),
                        content: Column(
                          children: [
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Name'),
                              controller: nameController,
                            ),
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Age'),
                              controller: ageController,
                            ),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              name = nameController.text;
                              age = ageController.text;
                              setState(() {
                                submited = true;
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text("Submit"),
                          )
                        ],
                      );
                    }),
                  );
                },
                child: const Text(
                  "Please provide\nyour information",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              )
            : content,
      ),
    );
  }
}
