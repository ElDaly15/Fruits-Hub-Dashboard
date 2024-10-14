import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_app_buttom.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/domain/entites/product_enitity.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/presentation/manager/product_code_check_cubit/product_code_check_cubit.dart';
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
  int? expiryMonth, calories, amountUnit;
  bool? isFeatured = false, isOrganic = false, isCodeExisted = false;
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
                    expiryMonth = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  obscureText: false,
                  isPassword: false,
                  hintText: 'Expiry Months'),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                  onChanged: (value) {
                    calories = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  obscureText: false,
                  isPassword: false,
                  hintText: 'Calories '),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                  onChanged: (value) {
                    amountUnit = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  obscureText: false,
                  isPassword: false,
                  hintText: ' Calories Per Unit'),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                  onChanged: (value) {
                    description = value;
                  },
                  keyboardType: TextInputType.name,
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
                title: 'Is Featured ? ',
                onTap: () {},
                onValueChanged: (value) {
                  isFeatured = value;
                },
              ),
              PrivacyCheck(
                title: 'Is Organic ? ',
                onTap: () {},
                onValueChanged: (value) {
                  isOrganic = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButtom(
                  onPressed: () async {
                    if (fileImage != null) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        ProductEntity prodcutEntity = ProductEntity(
                            name: name!,
                            sellCount: 0,
                            price: price!,
                            reviews: [],
                            code: code!,
                            description: description!,
                            imageFile: fileImage!,
                            isFeatured: isFeatured!,
                            expiryMonths: expiryMonth!,
                            avgRating: 0,
                            isOrganic: isOrganic!,
                            amountUnit: amountUnit!,
                            ratingCount: 0,
                            calories: calories!);

                        isCodeExisted =
                            await BlocProvider.of<ProductCodeCheckCubit>(
                                    context)
                                .checkCode(code: code!);

                        if (isCodeExisted!) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Product Code Existed , Can\'t Add This Prodcut')));

                          return;
                        } else {
                          // ignore: use_build_context_synchronously
                          BlocProvider.of<AddProductCubit>(context)
                              .addProduct(addProductEntity: prodcutEntity);
                        }
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
