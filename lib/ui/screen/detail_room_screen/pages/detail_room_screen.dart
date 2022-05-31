import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/ui/screen/detail_room_screen/widgets/build_room_detail.dart';
import '../bloc/detail_bloc.dart';
import '../bloc/detail_event.dart';
import '../bloc/detail_state.dart';

class DetailRoomScreen extends StatefulWidget {
  int back;
  late String postId;

  DetailRoomScreen({required this.back, required this.postId});

  @override
  _DetailRoomScreenState createState() => _DetailRoomScreenState();
}

class _DetailRoomScreenState extends State<DetailRoomScreen> {
  final DetailBloc bloc = DetailBloc();

  @override
  void initState() {
    bloc.add(GetData(widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<DetailBloc>(
        create: (context) => bloc,
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailProcessing) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DetailSuccess) {
              return BuildRoomDetail(bloc, state.room, widget.back);
            }
            if (state is DetailError) {
              return Center(
                child: Text('Looi'),
              );
            }
            return Center();
          },
        ),
      ),
    );
  }
}
