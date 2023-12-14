import 'package:flutter/material.dart';

class task2_1 extends StatefulWidget {

  final String text1;
  final String text2;
  final String text3;

  task2_1({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
  }) : super(key: key);


  @override
  State<task2_1> createState() => _task2_1State();
}

class _task2_1State extends State<task2_1> {


  late String text1;
  late String text2;
  late String text3;

  @override
  void initState() {
    super.initState();
    text1 = widget.text1;
    text2 = widget.text2;
    text3 = widget.text3;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(color: Colors.blue,
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Name: $text1', style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Phone Number: $text2', style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('E-mail: $text3', style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold)),
                  ),
                ],
              )),

            ],
          ),
        ),
      ),
    );
  }
}
