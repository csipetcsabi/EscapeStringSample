import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:string_sample/bloc/content_bloc_barrel.dart';
import 'package:string_sample/content_model.dart';
import 'package:string_sample/database/database_provider.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  @override
  ContentState get initialState => InitialContentState();

  @override
  Stream<ContentState> mapEventToState(ContentEvent event) async* {
    if(event is LoadContent) {
      yield* _mapLoadContentToState(event);
    }
  }

  Stream<ContentState> _mapLoadContentToState(LoadContent event) async* {
    try {
      List<ContentModel> contentList = await DatabaseProvider.db.getAllContent();
      contentList.add(ContentModel(
        title: "Hardcoded model", 
        feedback: "Hardcoded string!\nGreat! \u{1F606} asdsad lkjsalkjds \u{f5dc}")
      );
      yield LoadedContentState(contentList: contentList);
    } catch(err) {
      print(err);
    }
  }
}
