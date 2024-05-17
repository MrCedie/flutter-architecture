import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_architectures/mvp/model/comment_model.dart';

final dio = Dio();

class CommentRepository {
  Future<List<CommentModel>> fetchComments() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/comments?_start=0&_limit=20');

    if (response.statusCode == 200) {
      return List.generate(
        response.data.length,
        (index) => CommentModel.fromJson(response.data[index]),
      );
    } else {
      throw Exception('Something went wrong');
    }
  }
}
