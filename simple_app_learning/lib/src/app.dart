import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app_learning/bloc/counter_bloc.dart';
import 'package:simple_app_learning/cubit/counter_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: BlocBuilder<CounterBloc, int>(
          builder: (BuildContext context, state) {
            return Text("$state", style: const TextStyle(fontSize: 34));
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterBloc.add(CounterIncrement()),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => counterBloc.add(CounterDecrement()),
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
