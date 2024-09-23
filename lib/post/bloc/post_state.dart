part of 'post_bloc.dart';

@immutable
sealed class PostState {
  final value;
  final message;
  const PostState({this.value, this.message});
}

final class PostInitial extends PostState {
  @override
  final value = false;
}

class postafterState extends PostState {
  @override
  final message;
  @override
  final value;

  const postafterState({required this.message,required this.value});
}


class circular extends PostState{
  
  @override
  // TODO: implement value
  get value => true;
}