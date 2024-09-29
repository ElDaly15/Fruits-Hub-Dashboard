import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/presentation/views/widgets/add_prodcut_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const String routeName = 'addProduct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddProdcutViewBody(),
    );
  }
}
