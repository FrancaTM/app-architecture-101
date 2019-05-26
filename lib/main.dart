import 'package:flutter/material.dart';

import 'package:app_architecture_101/data/repository.dart';
import 'package:app_architecture_101/screens/bloc/user_bloc_screen.dart';
import 'package:app_architecture_101/screens/vanilla/vanilla_screen.dart';
import 'package:app_architecture_101/screens/scoped_model/user_model_screen.dart';

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
              RaisedButton(
                onPressed: () {
                  _openVanilla(context);
                },
                child: Text('Vanilla'),
              ),
              RaisedButton(
                onPressed: () {
                  _openScopedModel(context);
                },
                child: Text('Scoped Model'),
              ),
              RaisedButton(
                onPressed: () {
                  _openBloc(context);
                },
                child: Text('BLoC'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openVanilla(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VanillaScreen(_repository),
      ),
    );
  }

  void _openScopedModel(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserModelScreen(_repository),
      ),
    );
  }

  void _openBloc(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserBlocScreen(_repository),
      ),
    );
  }
}
