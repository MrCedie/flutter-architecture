import 'package:dio/dio.dart';
import 'package:flutter_architectures/mvvm/model/user_model.dart';

class UserRepository {
  Future<User> fetchUser() async {
    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/users/1');

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    }

    throw "something went wrong";
  }
}