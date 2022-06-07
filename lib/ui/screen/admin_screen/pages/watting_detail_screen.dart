import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../detail_room_screen/bloc/detail_bloc.dart';
import '../../detail_room_screen/bloc/detail_event.dart';
import '../../detail_room_screen/bloc/detail_state.dart';
import 'build_room_watting.dart';

class WattingDetailScreen extends StatefulWidget {
  int back;
  late String postId;

  WattingDetailScreen({required this.back, required this.postId});

  @override
  _WattingDetailScreenState createState() => _WattingDetailScreenState();
}

class _WattingDetailScreenState extends State<WattingDetailScreen> {
  final DetailBloc bloc = DetailBloc();
  @override
  void initState() {
    bloc.add(GetData(widget.postId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<DetailBloc>(
        create: (context) => bloc,
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailProcessing) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DetailSuccess) {
              return BuildRoomWatting(state.room, widget.back);
            }
            if (state is DetailError) {
              return const Center(
                child: Text('Đã xảy ra lỗi'),
              );
            }
            return const Center();
          },
        ),
      ),
    );
  }
}
