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



  void _navigateToDetail() {
    String text1 = _n.text;
    String text2 = _p.text;
    String text3 = _e.text;

    _n.clear();
    _p.clear();
    _e.clear();


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => task2_1(text1: text1, text2: text2, text3: text3),
      ),
    );
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
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _p,
                decoration: InputDecoration(
                  labelText: 'Enter Mobile Number',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _e,
                decoration: InputDecoration(
                  labelText: 'Enter E-mail',
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: (){
                _navigateToDetail();
              },
                  child: Text("Ok")
              ),
              // SizedBox(height: 30),
              // Expanded(
              //   child: ListView.builder(
              //       itemCount: _addItem.length,
              //       itemBuilder: (BuildContext context, int index){
              //         return GestureDetector(
              //           onTap: (){
              //           },
              //           child: Card(
              //             elevation: 9,
              //             child: ListTile(
              //               title: Text(_writtentext[index].toString()),
              //             ),
              //           ),
              //         );
              //       }
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
