import 'dart:async';
import 'package:flutter_architectures/mvc/model/post_model.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class PostController {
  Future<List<PostModel>> fetchPost() async {
    final response = await dio
        .get('https://jsonplaceholder.typicode.com/posts?_start=0&_limit=20');

    if (response.statusCode == 200) {
      return List.generate(response.data.length,
          (index) => PostModel.fromJson(response.data[index]));
    } else {
      throw Exception('something went wrong');
    }
  }
}
