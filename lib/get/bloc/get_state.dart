part of 'get_bloc.dart';

@immutable
sealed class GetState {
  final body = '';
  final value = false;
}

final class GetInitial extends GetState {}

class ApiState extends GetState {
  final body = Api.getData();
  @override
  // ignore: overridden_fields
  final value = true;
}
