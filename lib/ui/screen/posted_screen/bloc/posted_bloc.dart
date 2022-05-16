import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/post_provider.dart';

import '../../../../models/room.dart';
import 'posted_event.dart';
import 'posted_state.dart';

class PostedBloc extends Bloc<PostedEvent, PostedState> {
  PostedBloc() : super(PostedInitial());
  String errorMessage = '';
  final PostProvider postProvider = PostProvider();
  List<Room> list = [];
  void dispose() {
    close();
  }

  @override
  Stream<PostedState> mapEventToState(PostedEvent event) async* {
    if (event is GetData) {
      yield PostedProcessing();
      list = await postProvider.getData();
      yield PostedSuccess(list);
    }
  }
}
