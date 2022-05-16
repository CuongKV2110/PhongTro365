import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phongtro/ui/screen/posted_screen/bloc/posted_bloc.dart';
import 'package:phongtro/ui/screen/posted_screen/bloc/posted_event.dart';
import 'package:phongtro/ui/screen/posted_screen/bloc/posted_state.dart';

class PostedScreen extends StatefulWidget {
  const PostedScreen({Key? key}) : super(key: key);

  @override
  _PostedScreenState createState() => _PostedScreenState();
}

class _PostedScreenState extends State<PostedScreen> {
  PostedBloc _bloc = PostedBloc();

  @override
  void initState() {
    _bloc.add(GetData());
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
              return ListView.builder(
                  itemCount: _bloc.list.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(_bloc.list[index].postID),
                            subtitle: Text(_bloc.list[index].content),
                          ),
                        ),
                        Image.network(_bloc.list[index].imgUrl),
                      ],
                    );
                  });
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
