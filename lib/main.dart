import 'package:flutter/material.dart';

import 'package:LogJogg/themes/DefaultTheme.dart';
import 'package:LogJogg/pages/HomePage.dart';

void main() {
  runApp(LogJoggApp());
}

class LogJoggApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log Jogg',
      theme: getDefaultTheme(),
      home: HomePage('Log Jogg'),
    );
  }
}
