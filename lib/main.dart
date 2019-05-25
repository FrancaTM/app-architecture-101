import 'package:flutter/material.dart';

import 'repository.dart';
import 'vanilla_screen.dart';
import 'user_model_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Repository _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VanillaScreen(_repository),
                    ),
                  );
                },
                child: Text('Vanilla'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserModelScreen(_repository),
                    ),
                  );
                },
                child: Text('Scoped Model'),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('BLoC'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
