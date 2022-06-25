import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/states.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: _MyHomePageview(title: title),
    );
  }
}

class _MyHomePageview extends StatelessWidget {
  const _MyHomePageview({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  state.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                // ignore: avoid_returning_null_for_void
                onPressed: () => counterBloc.add(IncrementCounterEvent()),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: () => counterBloc.add(DecrementCounterEvent()),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        );
      },
    );
  }
}
