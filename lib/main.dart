import 'package:LogJogg/blocs/location/location_bloc.dart';
import 'package:flutter/material.dart';

import 'package:LogJogg/themes/DefaultTheme.dart';
import 'package:LogJogg/pages/HomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(LogJoggApp());
}

class LogJoggApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log Jogg',
      theme: getDefaultTheme(),
      home: BlocProvider(
        create: (BuildContext context) => LocationBloc(),
        child: HomePage('Log Jogg'),
      ),
    );
  }
}
