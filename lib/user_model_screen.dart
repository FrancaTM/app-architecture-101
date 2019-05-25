import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'repository.dart';
import 'user_model.dart';

class UserModelScreen extends StatefulWidget {
  final Repository _repository;

  UserModelScreen(this._repository);

  @override
  _UserModelScreenState createState() => _UserModelScreenState();
}

class _UserModelScreenState extends State<UserModelScreen> {
  UserModel _userModel;

  @override
  void initState() {
    super.initState(); // TODO: modificar posição da chamada? vvv
    _userModel = UserModel(widget._repository);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: _userModel,
      child: Scaffold(
        backgroundColor: Colors.purpleAccent.shade200,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Scoped Model'),
        ),
        body: SafeArea(
          child: ScopedModelDescendant<UserModel>(
            builder: (context, child, model) {
              if (model.isLoading) {
                return _buildLoading();
              } else {
                if (model.user != null) {
                  return _buildContent(model);
                } else {
                  return _buildInit(model);
                }
              }
            },
          ),
        ),
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

  Widget _buildContent(UserModel userModel) {
    return Center(
      child: Text('Hello ${userModel.user.name} ${userModel.user.surname}'),
    );
  }

  Widget _buildInit(UserModel userModel) {
    return Center(
      child: RaisedButton(
        child: Text('Load user data'),
        onPressed: () {
          userModel.loadUserData();
        },
      ),
    );
  }
}
