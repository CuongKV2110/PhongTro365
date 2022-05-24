import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/post_provider.dart';
import '../../../../models/room.dart';
import 'newfeed_state.dart';

class NewFeedBloc extends Cubit<NewFeedState> {
  NewFeedBloc() : super(NewFeedInitial());

  Future<void> getData() async {
    emit(NewFeedLoading());
    List<Room> newList = await PostProvider.getData();

    emit(NewFeedLoaded(data: newList));
  }

  void refreshData() async {
    print('Refresh data');
    getData();
  }

  void dispose() {
    close();
  }
}
