import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/post_provider.dart';
import '../../../../../models/room.dart';
import 'watting_state.dart';

class WattingBloc extends Cubit<WattingState> {
  WattingBloc() : super(WattingInitial());

  Future<void> getData() async {
    emit(WattingLoading());
    List<Room> newList = await PostProvider.getData();

    emit(WattingLoaded(data: newList));
  }

  void refreshData() async {
    print('Refresh data');
    getData();
  }

  void dispose() {
    close();
  }
}
