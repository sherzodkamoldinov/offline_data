import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:offline_data/cubit/conectivity/connectivity_cubit.dart';
import 'package:offline_data/cubit/currency/currency_cubit.dart';
import 'package:offline_data/data/models/currency/currency_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocProvider.of<CurrencyCubit>(context).state.isInternet
            ? Text('ONLINE')
            : Text('OFFLINE'),
      ),
      body: BlocListener<ConnectivityCubit, ConnectivityState>(
        listener: (BuildContext context, connectState) {
          if (connectState.connectivityResult != ConnectivityResult.none) {
            context.read<CurrencyCubit>().getCurrenciesFromInternet();
          } else {
            context.read<CurrencyCubit>().getCurrenciesFromStorage();
          }
        },
        child: BlocConsumer<CurrencyCubit, CurrencyState>(
          builder: (BuildContext context, currencyState) {
            List<CurrencyModel> cur = currencyState.currencies;
            return currencyState.status.isSubmissionInProgress
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: cur.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(cur[index].title),
                      );
                    },
                  );
          },
          listener: (BuildContext context, Object? state) {},
        ),
      ),
    );
  }
}
