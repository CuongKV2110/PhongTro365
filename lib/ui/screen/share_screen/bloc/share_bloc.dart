import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/providers/post_provider.dart';
import '../../../../models/room.dart';
import 'share_state.dart';

class ShareBloc extends Cubit<ShareState> {
  ShareBloc() : super(ShareInitial());

  Future<void> getData() async {
    emit(ShareLoading());
    List<Room> newList = await PostProvider.getData();

    emit(ShareLoaded(newList));
  }
}
