import 'package:flutter/foundation.dart';
import 'package:flutter_architectures/mvvm/model/user_model.dart';
import 'package:flutter_architectures/mvvm/repository/user_repository.dart';

class UserViewModel with ChangeNotifier {
  final UserRepository _userRepository;

  UserViewModel(this._userRepository);

  User? _user;
  User? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _isError;
  String? get isError => _isError;

  Future<void> fetchUser() async {
    try {
      _isLoading = true;
      notifyListeners();

      _user = await _userRepository.fetchUser();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();

      _isError = e.toString();
      notifyListeners();
    }
  }
}
