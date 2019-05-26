import 'package:flutter/material.dart';

import 'package:app_architecture_101/data/repository.dart';
import 'package:app_architecture_101/data/user.dart';
import 'user_bloc.dart';

class UserBlocScreen extends StatefulWidget {
  final Repository _repository;

  UserBlocScreen(this._repository);

  @override
  _UserBlocScreenState createState() => _UserBlocScreenState();
}

class _UserBlocScreenState extends State<UserBlocScreen> {
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = UserBloc(widget._repository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.shade200,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Bloc'),
      ),
      body: SafeArea(
        child: StreamBuilder<UserState>(
          stream: _userBloc.user,
          initialData: UserInitState(),
          builder: (context, snapshot) {
            if (snapshot.data is UserInitState) {
              return _buildInit();
            }
            if (snapshot.data is UserDataState) {
              UserDataState state = snapshot.data;
              return _buildContent(state.user);
            }
            if (snapshot.data is UserLoadingState) {
              return _buildLoading();
            }
          },
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

  Widget _buildContent(User user) {
    return Center(
      child: Text('Hello ${user.name} ${user.surname}'),
    );
  }

  Widget _buildInit() {
    return Center(
      child: RaisedButton(
        child: Text('Load user data'),
        onPressed: () {
          _userBloc.loadUserData();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _userBloc.dispose(); // TODO: modificar posição da chamada? vvv
  }
}
