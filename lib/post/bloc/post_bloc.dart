import 'package:api_test/api/get.dart';
import 'package:api_test/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<ApiPostEvent>((event, emit) async {

      
      emit(circular());

      final message = await Api.postAddress(event.AddressModel);

      print('inside bloc message: $message');

      emit(postafterState(message: message,value: false));
    });
  }
}
