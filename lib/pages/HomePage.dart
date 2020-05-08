import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final String title;

  HomePage(this.title);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: null,
    );
  }
}