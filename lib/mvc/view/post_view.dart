import 'package:flutter/material.dart';
import 'package:flutter_architectures/mvc/model/post_model.dart';

class PostView extends StatelessWidget {
  final List<PostModel>? posts;
  final bool isLoading;
  final String? errorMessage;

  const PostView({
    super.key,
    required this.posts,
    required this.isLoading,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : ListView.builder(
                  itemCount: posts?.length ?? 0,
                  itemBuilder: (ctx, i) => ListTile(
                    title: Text(posts?[i].title ?? ''),
                    subtitle: Text(posts?[i].body ?? ''),
                  ),
                ),
    );
  }
}
