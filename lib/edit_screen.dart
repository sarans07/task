import 'package:flutter/material.dart';
class EditScreen extends StatefulWidget {
  final String data;

  const EditScreen({Key? key, required this.data}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _n;
  late TextEditingController _p;
  late TextEditingController _e;

  @override
  void initState() {
    super.initState();
    List<String> dataList = widget.data.split('\n');
    _n = TextEditingController(text: dataList[0]);
    _p = TextEditingController(text: dataList[1]);
    _e = TextEditingController(text: dataList[2]);
  }

  @override
  void dispose() {
    _n.dispose();
    _p.dispose();
    _e.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data',
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _n,
              decoration: InputDecoration(
                labelText: 'Edit Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _p,
              decoration: InputDecoration(
                labelText: 'Edit Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _e,
              decoration: InputDecoration(
                labelText: 'Edit E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String editedData =
                    '${_n.text}\n${_p.text}\n${_e.text}';
                Navigator.pop(context, editedData);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

