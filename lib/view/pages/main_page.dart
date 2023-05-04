import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_bloc.dart';
import '../widgets/number_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // untuk watch
    CounterState counterState = context.watch<CounterBloc>().state;

    // untuk select
    int? number = context.select<CounterBloc, int?>((counterBloc) =>
        (counterBloc.state is CounterValue)
            ? (counterBloc.state as CounterValue).value
            : null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with bloc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // membuat card untuk BlocBuilder
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return NumberCard(
                      teks: 'Builder',
                      data: (state is CounterValue) ? state.value : '-');
                },
              ),
              // membuat card untuk watch
              NumberCard(
                teks: 'Watch',
                data: (counterState is CounterValue) ? counterState.value : '-',
              ),
              // membuat card untuk select
              NumberCard(
                teks: 'Select',
                data: (number == null) ? '-' : number,
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(Increment());
              },
              child: const Text('INCREMENT'))
        ],
      ),
    );
  }
}
