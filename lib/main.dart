/*
Question 2: Scaffold with Dynamic Content

Task:

Develop an application using the Scaffold widget. The content of the screen should change dynamically based on user interaction (e.g., selecting different options from a dropdown menu).
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'introductiontowidgets_scaffoldwithdynamiccontent',
      home: YourDynamicScreen(),
    );
  }
}

class YourDynamicScreen extends StatefulWidget {
  const YourDynamicScreen({super.key});

  @override
  State<YourDynamicScreen> createState() => _YourDynamicScreenState();
}

class _YourDynamicScreenState extends State<YourDynamicScreen> {
  // final dropDownOptions = <String>[
  //   'Initial Content', 'Option 1', 'Option 2', 'Option 3', 'Option 4'];
  // final textForEachOption = <String>['Content for Initial Content', 'Content for Option 1', 'Content for Option 2', 'Content for Option 3', 'Content for Option 4'];
  final dropDownOptionMap = <String, String>{
    'Initial Content': 'Content for Initial Content',
    'Option 1': 'Content for Option 1',
    'Option 2': 'Content for Option 2',
    'Option 3': 'Content for Option 3',
    'Option 4': 'Content for Option 4'
  };
  String dropDownValue = 'Initial Content';
  String dropDownValueContent = 'Content for Initial Content';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            dropDownMethod(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                dropDownValueContent,
              ),
            ),
          ],
        ),
      )),
    );
  }

  DropdownButton<String> dropDownMethod() {
    return DropdownButton<String>(
        value: dropDownValue,
        icon: const Icon(Icons.heat_pump_rounded),
        onChanged: (String? value) {
          setState(() {
            dropDownValue = value ?? dropDownValue;
            dropDownValueContent = dropDownOptionMap[dropDownValue] ??
                'Content for Initial Content';
          });
        },
        items: dropDownOptionMap.entries.map((entries) {
          return DropdownMenuItem<String>(
            value: entries.key,
            child: Text(entries.key),
          );
        }).toList());
  }
}
