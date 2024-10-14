import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'add_prodcut_view_body.dart';

class AddProdcutViewBodyBlocConsumer extends StatelessWidget {
  const AddProdcutViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product Added'),
            ),
          );
        }
        if (state is AddProductFailuer) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMsg),
            ),
          );
        }
      },
      builder: (context, state) {
        return const ModalProgressHUD(
          color: Colors.transparent,
          progressIndicator: CircularProgressIndicator(
              backgroundColor: Colors.green, color: Colors.lime),
          inAsyncCall: true,
          child: AddProdcutViewBody(),
        );
      },
    );
  }
}
