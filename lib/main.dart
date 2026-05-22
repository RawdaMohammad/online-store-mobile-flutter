import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/core/theme/app_theme.dart';
import 'package:online_store/features/products/viewmodels/product_cubit.dart';
import 'package:online_store/features/products/views/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Store',
      theme: AppTheme.appTheme,
      home: BlocProvider(
        create: (context) => ProductCubit(),
        child: ProductScreen(),
      ),
    );
  }
}
