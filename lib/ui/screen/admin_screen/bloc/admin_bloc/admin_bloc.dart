import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/post_provider.dart';
import '../../../../../models/room.dart';
import 'admin_state.dart';

class AdminBloc extends Cubit<AdminState> {
  AdminBloc() : super(AdminInitial());

  Future<void> getData() async {
    emit(AdminLoading());
    List<Room> newList = await PostProvider.getData();
    emit(AdminLoaded(data: newList));
  }

  void refreshData() async {
    print('Refresh data');
    getData();
  }

  void dispose() {
    close();
  }
}
