import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/post_provider.dart';
import '../../../../../models/comment.dart';
import 'comment_state.dart';

class CommentBloc extends Cubit<CommentState> {
  CommentBloc() : super(CommentInitial());

  Future<void> LoadComment() async {
    emit(CommentLoading());

    List<Comment> newList = await PostProvider.getComment();

    emit(CommentLoaded(newList));
  }
}
