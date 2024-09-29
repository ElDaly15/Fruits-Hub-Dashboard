import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper/on_generate_routes.dart';
import 'package:fruits_hub_dashboard/featuers/dashboard/presentation/views/dashboard_view.dart';

void main() {
  runApp(const FruitsDashBoard());
}

class FruitsDashBoard extends StatelessWidget {
  const FruitsDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashboardView.routeName,
    );
  }
}
