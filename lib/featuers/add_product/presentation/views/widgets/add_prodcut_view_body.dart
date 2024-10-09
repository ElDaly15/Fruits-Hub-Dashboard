import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_app_buttom.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/presentation/views/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/presentation/views/widgets/featuer_check.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/presentation/views/widgets/image_field.dart';

class AddProdcutViewBody extends StatefulWidget {
  const AddProdcutViewBody({super.key});

  @override
  State<AddProdcutViewBody> createState() => _AddProdcutViewBodyState();
}

class _AddProdcutViewBodyState extends State<AddProdcutViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? name, code, description, price;
  bool? isFeatured = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
              child: Column(
            children: [
              CustomTextField(
                  onChanged: (value) {
                    name = value;
                  },
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  obscureText: false,
                  isPassword: false,
                  hintText: 'Product Name'),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                  onChanged: (value) {
                    price = value;
                  },
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  obscureText: false,
                  isPassword: false,
                  hintText: 'Product Price'),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                  onChanged: (value) {
                    code = value.toLowerCase();
                  },
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  obscureText: false,
                  isPassword: false,
                  hintText: 'Product Code'),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                  onChanged: (value) {
                    description = value;
                  },
                  keyboardType: TextInputType.number,
                  maxLines: 5,
                  obscureText: false,
                  isPassword: false,
                  hintText: 'Product Description'),
              const SizedBox(
                height: 16,
              ),
              ImageField(
                onFileChanged: (fileImage) {
                  this.fileImage = fileImage;
                },
              ),
              PrivacyCheck(
                onTap: () {},
                onValueChanged: (value) {
                  isFeatured = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButtom(
                  onPressed: () {
                    if (fileImage != null) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        //   print('Validated');
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('يجب أختيار صورة')));
                      return;
                    }
                  },
                  text: 'Add Product'),
              const SizedBox(
                height: 16,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
