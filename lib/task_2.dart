
import 'package:flutter/material.dart';
import 'package:saran_task/task_2_1.dart';

class task2 extends StatefulWidget {
  const task2({Key? key}) : super(key: key);

  @override
  State<task2> createState() => _task2State();
}

class _task2State extends State<task2> {
  TextEditingController _n = TextEditingController();
  TextEditingController _p = TextEditingController();
  TextEditingController _e = TextEditingController();
  List<String> _writtentext = [];

  void _navigateToDetail(String data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => task2_1(data: data),
      ),
    );
  }

  void _addItemToList() {
    String text1 = _n.text;
    String text2 = _p.text;
    String text3 = _e.text;
    if (text1.isNotEmpty && text2.isNotEmpty && text3.isNotEmpty) {
      setState(() {
      _writtentext.add('$text1\n$text2\n$text3');
      _n.clear();
      _p.clear();
      _e.clear();
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                controller: _n,
                decoration: InputDecoration(
                  labelText: 'Enter Your Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _p,
                decoration: InputDecoration(
                  labelText: 'Enter Mobile Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _e,
                decoration: InputDecoration(
                  labelText: 'Enter E-mail',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _addItemToList();
                },
                child: Text("Ok"),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: _writtentext.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _navigateToDetail(_writtentext[index]);
                      },
                      child: Card(
                        elevation: 9,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            _writtentext[index],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
