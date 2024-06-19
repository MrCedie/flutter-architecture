import 'package:flutter/material.dart';
import 'package:flutter_architectures/mvvm/view-model/counter_viewmodel.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late final CounterViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CounterViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _viewModel.count.toString(),
            style: const TextStyle(fontSize: 24),
          ),
          TextButton(
            onPressed: () {
              _viewModel.helloWorld();
            },
            child: const Text('click me'),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _viewModel.increment();
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    ));
  }
}
