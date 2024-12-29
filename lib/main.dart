import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LifecycleDemo(),
    );
  }
}

class LifecycleDemo extends StatefulWidget {
  const LifecycleDemo({super.key});

  @override
  _LifecycleDemoState createState() => _LifecycleDemoState();
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  @override
  void initState() {
    super.initState();
    log('initState - Widget created');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log('didChangeDependencies - Dependencies changed');
  }

  @override
  void didUpdateWidget(LifecycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    log('didUpdateWidget - Widget updated');
  }

  @override
  void deactivate() {
    log('deactivate - Widget is about to be removed');
    super.deactivate();
  }

  @override
  void dispose() {
    log('dispose - Widget destroyed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('build - Widget building');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Lifecycle Demo"),
      ),
      body: const Center(
        child: Text(
          'Check console to see widget lifecycle events',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            log('setState - State updated');
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
