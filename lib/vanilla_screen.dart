import 'package:flutter/material.dart';

import 'repository.dart';
import 'user.dart';

class VanillaScreen extends StatefulWidget {
  final Repository _repository;

  VanillaScreen(this._repository);

  @override
  _VanillaScreenState createState() => _VanillaScreenState();
}

class _VanillaScreenState extends State<VanillaScreen> {
  bool _isLoading = false;
  User _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.shade200,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Vanilla'),
      ),
      body: SafeArea(
        child: _isLoading ? _buildLoading() : _buildBody(),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation(Colors.orangeAccent.shade100),
      ),
    );
  }

  Widget _buildBody() {
    if (_user != null) {
      return _buildContent();
    } else {
      return _buildInit();
    }
  }

  Widget _buildContent() {
    return Center(
      child: Text('Hello ${_user.name} ${_user.surname}'),
    );
  }

  Widget _buildInit() {
    return Center(
      child: RaisedButton(
        child: Text('Load user data'),
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          widget._repository.getUser().then((user) {
            setState(() {
              _user = user;
              _isLoading = false;
            });
          });
        },
      ),
    );
  }
}
