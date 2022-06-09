import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/post_provider.dart';
import '../../../../models/room.dart';
import 'share_state.dart';

class ShareBloc extends Cubit<ShareState> {
  ShareBloc() : super(ShareInitial());

  Future<void> getData() async {
    emit(ShareLoading());
    List<Room> list = await PostProvider.getData();
    List<Room> listfinal = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i].status == 1) {
        listfinal.add(list[i]);
      }
    }
    emit(ShareLoaded(listfinal));
  }

  void refreshData() async {
    print('Refresh data');
    getData();
  }
}
