
import 'package:flutter/material.dart';

class task2_1 extends StatefulWidget {
  final String data;

  task2_1({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<task2_1> createState() => _task2_1State();
}

class _task2_1State extends State<task2_1> {
  @override
  Widget build(BuildContext context) {
    List<String> dataList = widget.data.split('\n');

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Name: ${dataList[0]}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Phone Number: ${dataList[1]}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'E-mail: ${dataList[2]}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
