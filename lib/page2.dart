import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {

  final int statusCode;

  const Page2({Key key, this.statusCode}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is page 2"),
      ),
      body: Center(
        child: Container(
          child: Text(statusCode.toString()),
        ),
      ),
    );
  }
}
