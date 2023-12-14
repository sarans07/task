import 'package:flutter/material.dart';

enum SortOrder { Ascending, Descending }
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController = TextEditingController();
  List<String> _enteredTextList = [];
  String _minValue = '';
  String _maxValue = '';
  SortOrder _currentSortOrder = SortOrder.Ascending;

  void _addItemToList() {
    setState(() {
      _enteredTextList.add(_textController.text);
      _textController.clear();
      _sortList();
      _updateMinMaxValues();
    });
  }

  void _sortList() {
    if (_currentSortOrder == SortOrder.Ascending) {
      _enteredTextList.sort();
    } else {
      _enteredTextList.sort((a, b) => b.compareTo(a));
    }
  }

  void _updateMinMaxValues() {
    if (_enteredTextList.isNotEmpty) {
      _minValue = _enteredTextList.first;
      _maxValue = _enteredTextList.last;
    } else {
      _minValue = '';
      _maxValue = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    List displayList = _enteredTextList.where((item) => item.length < 5).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sort Text List'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                DropdownButton<SortOrder>(
                  value: _currentSortOrder,
                  onChanged: (SortOrder? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _currentSortOrder = newValue;
                        _sortList();
                        _updateMinMaxValues();
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
              ],
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter text here',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addItemToList,
              child: Text('Add to List'),
            ),
            SizedBox(height: 20),
            Text('Min Value: $_minValue'),
            Text('Max Value: $_maxValue'),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: displayList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(displayList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
