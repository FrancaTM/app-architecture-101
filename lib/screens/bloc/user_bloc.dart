import 'dart:async';

import 'package:app_architecture_101/data/repository.dart';
import 'package:app_architecture_101/data/user.dart';

class UserBloc {
  final Repository _repository;

  UserBloc(this._repository);

  final _userStreamController = StreamController<UserState>();

  Stream<UserState> get user => _userStreamController.stream;

  void loadUserData() {
    _userStreamController.sink.add(UserState._userLoading());
    _repository.getUser().then((user) {
      _userStreamController.sink.add(UserState._userData(user));
    });
  }

  void dispose() {
    _userStreamController.close();
  }
}

class UserState {
  UserState();
  factory UserState._userData(User user) = UserDataState;
  factory UserState._userLoading() = UserLoadingState;
}

class UserInitState extends UserState {}

class UserLoadingState extends UserState {}

class UserDataState extends UserState {
  final User user;
  UserDataState(this.user);
}
