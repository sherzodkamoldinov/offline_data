import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_data/cubit/conectivity/connectivity_cubit.dart';
import 'package:offline_data/cubit/currency/currency_cubit.dart';
import 'package:offline_data/data/repository/currency_repository.dart';
import 'package:offline_data/ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectivityCubit>(
      create: (context) =>
          ConnectivityCubit(),
      child: BlocProvider<CurrencyCubit>(
        create: (context) => CurrencyCubit(currencyRepository: CurrencyRepository()),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
