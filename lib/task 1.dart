import 'package:flutter/material.dart';
enum SortOrder {Ascending,Descending}
class task extends StatefulWidget {
  const task({super.key});

  @override
  State<task> createState() => _taskState();
}

class _taskState extends State<task> {

  TextEditingController _n = TextEditingController();
  List<String> _writtentext = [];
  String _min = "";
  String _max = "";
  SortOrder _sortOrder = SortOrder.Ascending;



  void _addItem(){
    setState(() {
      _writtentext.add(_n.text);
      _n.clear();
      _writtentext.sort((a, b) => b.compareTo(a));
      _updateMinandMax();
    });
  }

  void _sortList() {
    if (_sortOrder == SortOrder.Ascending) {
      _writtentext.sort();
    } else {
      _writtentext.sort((a, b) => b.compareTo(a));
    }
  }

  void _updateMinandMax(){
    if(_writtentext.isNotEmpty){
      _min = _writtentext.first;
      _max = _writtentext.last;
    }else{
      _min = "";
      _max = "";
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
              SizedBox(height: 50),
              TextFormField(
                controller: _n,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(onPressed: (){
                _addItem();
              },

                  child: Text("Ok")
              ),
              SizedBox(height: 20),
              Text("Minimum value is $_min",
                style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25),
              ),
              SizedBox(height: 20),
              Text("Maximum value is $_max",
                style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25),
              ),
              SizedBox(height: 20),
              DropdownButton(
                value: _sortOrder,
                onChanged: (SortOrder? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _sortOrder = newValue;
                      _sortList();
                      _updateMinandMax();
                    });
                  }
                },
                items: [
                  DropdownMenuItem(
                    value: SortOrder.Ascending,
                    child: Text('Ascending'),
                  ),
                  DropdownMenuItem(
                    value: SortOrder.Descending,
                    child: Text('Descending'),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: _writtentext.length,
                    itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      title: Text(_writtentext[index]),
                    );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
