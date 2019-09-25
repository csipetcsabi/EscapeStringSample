import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_sample/bloc/content_bloc_barrel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  final ContentBloc _contentBloc = ContentBloc()
    ..dispatch(LoadContent());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Escape demo',
      home: Scaffold(
        body: Container(
          child: BlocProvider<ContentBloc>(
            builder: (context) => _contentBloc,
            child: BlocBuilder(
              bloc: _contentBloc,
              builder: (BuildContext context, ContentState state) {
                if(state is LoadedContentState) {
                  return ListView.builder(
                    itemCount: state.contentList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(state.contentList[index].title,
                            style: const TextStyle(
                              fontSize: 20
                            ),
                          ),
                          subtitle: Text(state.contentList[index].feedback,
                            style: const TextStyle(
                              fontFamily: 'FontAwesome5Pro-Regular',
                              fontSize: 20
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator()
                  );
                }
              },
            ),
          ),
        ),
      )
    );
  }
}
