import 'package:flutter/material.dart';

class AddProdcutViewBody extends StatefulWidget {
  const AddProdcutViewBody({super.key});

  @override
  State<AddProdcutViewBody> createState() => _AddProdcutViewBodyState();
}

class _AddProdcutViewBodyState extends State<AddProdcutViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(),
      ),
    );
  }
}
