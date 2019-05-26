import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import 'package:app_architecture_101/data/repository.dart';
import 'package:app_architecture_101/data/user.dart';

class UserModel extends Model {
  final Repository _repository;

  UserModel(this._repository);

  bool _isLoading = false;
  User _user;

  User get user => _user;
  bool get isLoading => _isLoading;

  void loadUserData() {
    _isLoading = true;
    notifyListeners();

    _repository.getUser().then((user) {
      _user = user;
      _isLoading = false;
      notifyListeners();
    });
  }

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);
}
