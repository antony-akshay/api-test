import 'package:api_test/get/bloc/get_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class ScreenGet extends StatelessWidget {
  // BlocProvider.of<GetBloc>(context).add(Apievent());

  const ScreenGet({super.key});

  //List<dynamic> data = [];
  //bool value = false;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetBloc>(context).add(Apievent());
    return  Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // BlocConsumer<GetBloc, GetState>(
          //   listener: (context, state) {
          //     // TODO: implement listener
          //     data = state.data;
          //   },
          //   builder: (context, state) {
          //     return state.value
          //         ? Container()
          //         : ListView.builder(itemBuilder: (context, index) {
          //             return const ListTile();
          //           });
          //   },
          //)

          BlocBuilder<GetBloc, GetState>(
            builder: (context, state) {
              return 
              state.value?
              Container():
              ListTile(
                
              );
            },
          )
        ],
      )),
    );
  }
}
