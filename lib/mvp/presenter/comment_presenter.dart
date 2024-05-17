import 'package:flutter_architectures/mvp/model/comment_model.dart';
import 'package:flutter_architectures/mvp/repository/comment_repository.dart';

class CommentPresenter {
  final CommentRepository _commentRepository;
  late final CommentView _view;

  CommentPresenter(this._commentRepository);

  void attachView(CommentView view) {
    _view = view;
  }

  void getComments() {
    _commentRepository.fetchComments().then(
      (comments) {
        _view.showCommentData(comments);
      },
      onError: (error) {
        _view.showError(error.toString());
      },
    );
  }
}

abstract class CommentView {
  void showCommentData(List<CommentModel> comments);
  void showError(String message);
}
