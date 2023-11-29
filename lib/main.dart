import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      title: 'How much time? ❤️',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'How much time? ❤️'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DateTime _startDate = DateTime(2023, 1, 2, 0, 0, 0);
  Duration difference = Duration.zero;

  void _setTime() {
    setState(() {
      difference = DateTime.now().difference(_startDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 0), (timer) {
      _setTime();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Since",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26),
            ),
            Text(
              DateFormat.yMMMMd('en_US').format(_startDate),
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
            Text("${difference.inDays} days"),
            Text("${difference.inHours} hours"),
            Text("${difference.inMinutes} minutes"),
            Text("${difference.inSeconds} seconds"),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
