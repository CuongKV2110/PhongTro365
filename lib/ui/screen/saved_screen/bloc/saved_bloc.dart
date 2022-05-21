import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/post_provider.dart';
import '../../../../models/room.dart';
import 'saved_state.dart';

class SavedBloc extends Cubit<SavedState> {
  SavedBloc() : super(SavedInitial());

  Future<void> getData() async {
    emit(SavedLoading());

    List<Room> newList = await PostProvider.getData();

    emit(SavedLoaded(newList));
  }
}
