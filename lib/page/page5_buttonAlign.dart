import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_widget_app/widget/SquareButton.dart';

class ButtonAlignmentPage extends StatefulWidget {
  const ButtonAlignmentPage({super.key});

  @override
  State<ButtonAlignmentPage> createState() => _ButtonAlignmentPageState();
}

class _ButtonAlignmentPageState extends State<ButtonAlignmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.lightBlue),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SquareButton(text: 'Button1'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SquareButton(text: 'Button1'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SquareButton(text: 'Button1'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SquareButton(text: 'Button 1'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SquareButton(text: 'Button 1'),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
