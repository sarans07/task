
import 'package:flutter/material.dart';
import 'package:saran_task/task_2_1.dart';

import 'edit_screen.dart';

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
        builder: (context) => EditScreen(data: data),
      ),
    ).then((editedData) {
      if (editedData != null) {
        setState(() {
          _writtentext[_writtentext.indexWhere((element) => element == data)] =
              editedData;
        });
      }
    });
  }

  void _deleteItem(int index) {
    setState(() {
      _writtentext.removeAt(index);
    });
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
  void _navigateToDetails(String data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => task2_1(data: data),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Details',
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
          )),backgroundColor: Colors.blue,
      ),
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
                    _navigateToDetails(_writtentext[index]);
                  },
                  child: Card(
                    color: Colors.blue[200],
                    elevation: 9,
                    child: ListTile(
                      title: Text(
                        _writtentext[index],
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _navigateToDetail(_writtentext[index]);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteItem(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}
