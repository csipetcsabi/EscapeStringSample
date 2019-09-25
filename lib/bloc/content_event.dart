import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ContentEvent extends Equatable {
  ContentEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadContent extends ContentEvent {
  @override
  String toString() => "LoadingContent event triggered";
}