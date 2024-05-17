// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_architectures/mvc/controller/post_controller.dart';
import 'package:flutter_architectures/mvc/model/post_model.dart';
import 'package:flutter_architectures/mvc/view/post_view.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final PostController _controller = PostController();
  List<PostModel> _posts = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  void _fetchPosts() async {
    try {
      List<PostModel> posts = await _controller.fetchPost();
      setState(() {
        _posts = posts;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PostView(
      posts: _posts,
      isLoading: _isLoading,
      errorMessage: _errorMessage,
    );
  }
}
