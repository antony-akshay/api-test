import 'package:api_test/home/home.dart';
import 'package:api_test/models/models.dart';
import 'package:api_test/post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAddress extends StatelessWidget {
  ScreenAddress({super.key})
      : addressModel = Address(); // Initialize addressModel

  final Address addressModel; // No longer late
  final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is postafterState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
          if (state.message == 'success') {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const homeScreen()));
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 50), // Added right padding for better layout
              child: Form(
                key: globalFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 280,
                      height: 50,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(),
                        color: Color.fromARGB(255, 74, 163, 226),
                      ),
                      child: TextFormField(
                        onSaved: (input) => addressModel.type = input,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'type',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 280,
                      height: 50,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(),
                        color: Color.fromARGB(255, 74, 163, 226),
                      ),
                      child: TextFormField(
                        onSaved: (input) => addressModel.name = input,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'name',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 280,
                      height: 50,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(),
                        color: Color.fromARGB(255, 74, 163, 226),
                      ),
                      child: TextFormField(
                        onSaved: (input) => addressModel.contactNumber = input,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'contactNumber',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 280,
                      height: 50,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(),
                        color: Color.fromARGB(255, 74, 163, 226),
                      ),
                      child: TextFormField(
                        onSaved: (input) => addressModel.pincode = input,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'pin',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 280,
                      height: 50,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(),
                        color: Color.fromARGB(255, 74, 163, 226),
                      ),
                      child: TextFormField(
                        onSaved: (input) => addressModel.flat = input,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'flat',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 280,
                      height: 50,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(),
                        color: Color.fromARGB(255, 74, 163, 226),
                      ),
                      child: TextFormField(
                        onSaved: (input) => addressModel.area = input,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'area',
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 280,
                      height: 50,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(),
                        color: Color.fromARGB(255, 74, 163, 226),
                      ),
                      child: TextFormField(
                        onSaved: (input) => addressModel.landmark = input,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'landmark',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<PostBloc, PostState>(
                      builder: (context, state) {
                        return state.value
                            ? const CircularProgressIndicator()
                            : TextButton(
                                onPressed: () {
                                  if (validateAndSave()) {
                                    //print('${addressModel.name}');
                                    addressModel.token =
                                        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ZGIyNjRkZmJiZGE1NmIxZTQ1NDdjOSIsImlhdCI6MTcyNjc1MzEwNSwiZXhwIjoxNzI4MDcwNzA1fQ.N7EgpGSHXE2Ef49yX9edCymzcUotJSczB9L1VFtR8S8';
                                    BlocProvider.of<PostBloc>(context)
                                        .add(ApiPostEvent(
                                      AddressModel: addressModel,
                                    ));
                                  }
                                },
                                child: const Text('POST'),
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
