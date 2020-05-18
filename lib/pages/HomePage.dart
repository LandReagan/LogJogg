import 'package:LogJogg/blocs/location/location_bloc.dart';
import 'package:LogJogg/model/position_raw.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatelessWidget {

  final String title;

  HomePage(this.title);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: LocationWidget(),
    );
  }
}

class LocationWidget extends StatefulWidget {
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state is ErrorLocationState) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(state.message),));
        }
      },
      child: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is InitialLocationState) {
            return buildStartButton(context);
          }
          if (state is GetStreamLocationState) {
            return buildLocationTextWidget(context, state.stream);
          }
          return Text("This should not be there !");
        },
      ),
    );
  }

  Widget buildStartButton(BuildContext context) {
    return RaisedButton(
      child: Text('START GPS'),
      onPressed: () {
        final locationBloc = BlocProvider.of<LocationBloc>(context);
        locationBloc.add(LocationStartEvent());
      },
    );
  }

  Widget buildLocationTextWidget(BuildContext context, Stream<PositionRaw> locationStream) {
    return Column(
      children: <Widget>[
        Expanded(
          child: StreamBuilder(
            stream: locationStream,
            initialData: PositionRaw.stall(),
            builder: (BuildContext context, AsyncSnapshot<PositionRaw> snapshot) {
              String longitude = snapshot.data.longitude.toString();
              String latitude = snapshot.data.latitude.toString();
              return Text('LON: ' + longitude + ' LAT: ' + latitude);
            },
          ),
        ),
        RaisedButton(
          child: Text('STOP GPS'),
          onPressed: () {
            final locationBloc = BlocProvider.of<LocationBloc>(context);
            locationBloc.add(LocationStopEvent());
          },
        ),
      ],
    );
  }
}