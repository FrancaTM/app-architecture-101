import 'package:flutter/material.dart';

import 'package:app_architecture_101/data/repository.dart';
import 'package:app_architecture_101/screens/bloc/user_bloc_screen.dart';
import 'package:app_architecture_101/screens/vanilla/vanilla_screen.dart';
import 'package:app_architecture_101/screens/scoped_model/user_model_screen.dart';

enum AppArchitecture { Vanilla, ScopedModel, Bloc }

// TODO: Refactor classes' similar code

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Architectures',
      home: HomePage(Repository()),
    );
  }
}

class HomePage extends StatelessWidget {
  final Repository _repository;

  HomePage(this._repository);

  void _openScreen(BuildContext context, AppArchitecture architectureName) {
    Widget screen;
    switch (architectureName) {
      case AppArchitecture.Vanilla:
        screen = VanillaScreen(_repository);
        break;
      case AppArchitecture.ScopedModel:
        screen = UserModelScreen(_repository);
        break;
      case AppArchitecture.Bloc:
        screen = UserBlocScreen(_repository);
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  Widget _buildRaisedButton(
      BuildContext context, AppArchitecture architectureName) {
    return RaisedButton(
      onPressed: () {
        _openScreen(context, architectureName);
      },
      child: Text(architectureName.toString().split('.').last),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade900,
        title: Text('App Architectures'),
      ),
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildRaisedButton(context, AppArchitecture.Vanilla),
              _buildRaisedButton(context, AppArchitecture.ScopedModel),
              _buildRaisedButton(context, AppArchitecture.Bloc),
            ],
          ),
        ),
      ),
    );
  }
}
