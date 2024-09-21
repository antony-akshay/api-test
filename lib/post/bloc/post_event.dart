part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class ApiPostEvent extends PostEvent {
  final  Address AddressModel;

  ApiPostEvent({required this.AddressModel});
}
