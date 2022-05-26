import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/ui/screen/posted_screen/bloc/posted_bloc.dart';
import 'package:phongtro/ui/screen/posted_screen/bloc/posted_event.dart';
import 'package:phongtro/ui/screen/posted_screen/bloc/posted_state.dart';
import 'package:phongtro/ui/screen/posted_screen/widgets/build_room.dart';

class PostedScreen extends StatefulWidget {
  int back;
  late String postId;

  PostedScreen({required this.back, required this.postId});

  @override
  _PostedScreenState createState() => _PostedScreenState();
}

class _PostedScreenState extends State<PostedScreen> {
  final PostedBloc _bloc = PostedBloc();

  @override
  void initState() {
    _bloc.add(GetData(widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PostedBloc>(
        create: (context) => _bloc,
        child: BlocBuilder<PostedBloc, PostedState>(
          builder: (context, state) {
            if (state is PostedProcessing) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostedSuccess) {
              return BuildRoom(state.room, widget.back);
            }
            if (state is PostedError) {
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
