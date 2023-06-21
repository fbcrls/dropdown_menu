import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Dropdown Menu'),
        ),
        body: Dropdown(),
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  @override
  State<Dropdown> createState() => _DropdownState();
}

String items = 'Perak';
String negeri = 'Perak';
String ibunegeri = 'Ipoh';

void getNegeri() {
  if (items == 'Perak') {
    negeri = 'Perak';
    ibunegeri = 'Ipoh';
  } else if (items == 'Selangor') {
    negeri = 'Selangor';
    ibunegeri = 'Shah Alam';
  } else if (items == 'Negeri Sembilan') {
    negeri = 'Negeri Sembilan';
    ibunegeri = 'Seremban';
  } else if (items == 'Melaka') {
    negeri = 'Melaka';
    ibunegeri = 'Bandaraya Melaka';
  }
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          //dropdownbutton
          DropdownButton(
            //list of items
            items: [
              DropdownMenuItem<String>(
                child: Text('Selangor'),
                value: 'Selangor',
              ),
              DropdownMenuItem<String>(
                child: Text('Perak'),
                value: 'Perak',
              ),
              DropdownMenuItem<String>(
                child: Text('Negeri Sembilan'),
                value: 'Negeri Sembilan',
              ),
              DropdownMenuItem<String>(
                child: Text('Melaka'),
                value: 'Melaka',
              ),
            ],
            //if value is selected
            onChanged: (String? selectedValue) {
              if (selectedValue is String) {
                setState(() {
                  items = selectedValue;
                  getNegeri();
                });
              }
            },
            //show items
            value: items,
          ),
          //negeri
          Row(
            children: [
              Text('Negeri : $negeri'),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          //ibu negeri
          Row(
            children: [
              Text('Ibu negeri : $ibunegeri'),
            ],
          ),
        ],
      ),
    );
  }
}
