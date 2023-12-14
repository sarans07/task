import 'package:flutter/material.dart';
class saran extends StatefulWidget {
  final int value;

  const saran({Key? key, required this.value}) : super(key: key);

  @override
  State<saran> createState() => _saranState();
}

class _saranState extends State<saran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text(
          'Selected Value: ${widget.value}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}