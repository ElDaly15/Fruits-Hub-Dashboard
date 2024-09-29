import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_app_buttom.dart';
import 'package:fruits_hub_dashboard/featuers/add_product/presentation/views/add_product_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButtom(
              onPressed: () {
                Navigator.pushNamed(context, AddProductView.routeName);
              },
              text: 'Add Data'),
        ),
      ],
    );
  }
}
