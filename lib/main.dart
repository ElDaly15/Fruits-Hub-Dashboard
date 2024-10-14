import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/on_generate_routes.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruits_hub_dashboard/featuers/dashboard/presentation/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/firebase_options.dart';

import 'featuers/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FruitsDashBoard());
}

class FruitsDashBoard extends StatelessWidget {
  const FruitsDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(ImagesRepoImpl(), ProductRepoImpl()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: DashboardView.routeName,
      ),
    );
  }
}
