import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math';

part 'home_page.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increment({int count = 1}) => state = state + max(count, 1);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            CountText(),
          ],
        ),
      ),
      floatingActionButton: IncreaseButton(),
    );
  }
}

class IncreaseButton extends ConsumerWidget {
  const IncreaseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      splashColor: Colors.blue,
      onLongPress: () => ref.invalidate(counterProvider),
      onDoubleTap: () => ref.read(counterProvider.notifier).increment(count: 5),
      onTap: () => ref.read(counterProvider.notifier).increment(count: 1),
      child: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).increment(count: 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CountText extends ConsumerWidget {
  const CountText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      '${ref.watch(counterProvider)}',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
