import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:string_sample/content_model.dart';


@immutable
abstract class ContentState extends Equatable {
  ContentState([List props = const <dynamic>[]]) : super(props);
}

class InitialContentState extends ContentState {}

class LoadedContentState extends ContentState {
  final List<ContentModel> contentList;

  LoadedContentState({this.contentList}) : super([contentList]);

  @override
  String toString() => "LoadedContentState { contentList: ${contentList.toString}";
}