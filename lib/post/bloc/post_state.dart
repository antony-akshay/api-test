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
  final value = true;

  const postafterState({required this.message});
}
