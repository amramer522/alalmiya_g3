import 'package:alalmiya_g3/core/design/app_input.dart';
import 'package:flutter/material.dart';

import '../../core/design/my_app_bar.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final addressController = TextEditingController();
  final buildingNumberController = TextEditingController();
  final flootNumberController = TextEditingController();
  final appartmentNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(text: "Add Address"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 38),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AppInput(
                labelText: "Title",
                bgColor: Colors.transparent,
                controller: titleController,
                validator: (value) {
                  return myValidation(value, "Title");
                },
              ),
              AppInput(
                labelText: "Address",
                bgColor: Colors.transparent,
                controller: addressController,
                validator: (value) {
                  return myValidation(value, "Address");
                },
              ),
              AppInput(
                labelText: "Building No",
                bgColor: Colors.transparent,
                controller: buildingNumberController,
                validator: (value) {
                  return myValidation(value, "Building No");
                },
              ),
              AppInput(
                labelText: "Floor No",
                bgColor: Colors.transparent,
                controller: flootNumberController,
                validator: (value) {
                  return myValidation(value, "Floor No");
                },
              ),
              AppInput(
                labelText: "Apartment No",
                bgColor: Colors.transparent,
                controller: appartmentNumberController,
                validator: (value) {
                  return myValidation(value, "Apartment No");
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FilledButton(
            onPressed: () {
              formKey.currentState!.validate();
            },
            child: Text("Save")),
      )),
    );
  }

  String? myValidation(String? value, String name) {
    if (value!.isEmpty) {
      return "$name must be not empty";
    }
    return null;
  }
}
