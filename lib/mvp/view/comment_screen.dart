// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_architectures/mvp/model/comment_model.dart';
import 'package:flutter_architectures/mvp/presenter/comment_presenter.dart';
import 'package:flutter_architectures/mvp/repository/comment_repository.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> implements CommentView {
  late CommentPresenter _presenter;
  late String _errorMessage = '';
  List<CommentModel> _comments = [];

  @override
  void initState() {
    super.initState();
    _presenter = CommentPresenter(CommentRepository());
    _presenter.attachView(this);
    _presenter.getComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Center(
        child: _errorMessage.isNotEmpty
            ? Text(_errorMessage)
            : ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (ctx, i) => ListTile(
                  title: Text(_comments[i].name),
                  subtitle: Text(_comments[i].body),
                ),
              ),
      ),
    );
  }

  @override
  void showError(String message) {
    setState(() {
      _errorMessage = message;
    });
  }

  @override
  void showCommentData(List<CommentModel> comments) {
    setState(() {
      _comments = comments;
    });
  }
}
