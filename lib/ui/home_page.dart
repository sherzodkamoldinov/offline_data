import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:offline_data/cubit/conectivity/connectivity_cubit.dart';
import 'package:offline_data/cubit/currency/currency_cubit.dart';
import 'package:offline_data/data/models/currency/currency_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.watch<CurrencyCubit>().state.isInternet
              ? "ONLINE"
              : "OFFLINE",
        ),
      ),
      body: BlocListener<ConnectivityCubit, ConnectivityState>(
        listener: (BuildContext context, connectState) {
          if (connectState.connectivityResult != ConnectivityResult.none) {
            context.read<CurrencyCubit>().getCurrenciesFromInternet();
          } else {
            context.read<CurrencyCubit>().getCurrenciesFromStorage();
          }
          // debugPrint("INTERNET1: ${state.isInternet}");
        },
        child: BlocConsumer<CurrencyCubit, CurrencyState>(
          builder: (BuildContext context, currencyState) {
            List<CurrencyModel> cur = currencyState.currencies;
            return currencyState.status.isSubmissionInProgress
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cur.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(cur[index].title),
                        subtitle: currencyState.isInternet ? Text(cur[index].cbPrice) : null,
                      );
                    },
                  );
          },
          listener: (BuildContext context, state) {
            debugPrint("INTERNET WORK: ${state.isInternet}");
          },
        ),
      ),
    );
  }
}
