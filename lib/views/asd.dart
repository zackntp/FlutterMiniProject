import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ASD extends StatefulWidget {
  const ASD({super.key});

  @override
  State<ASD> createState() => _ASDState();
}

class _ASDState extends State<ASD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello world'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
    );
  }
}
