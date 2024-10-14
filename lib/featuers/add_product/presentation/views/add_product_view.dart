import 'package:flutter/material.dart';

import 'package:fruits_hub_dashboard/featuers/add_product/presentation/views/widgets/add_product_bloc_consumer.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const String routeName = 'addProduct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: const AddProdcutViewBodyBlocConsumer(),
    );
  }
}
