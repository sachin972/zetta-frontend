// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zesta_frontend/Pages/Home.dart';
import 'package:zesta_frontend/Pages/Login.dart';
import 'package:zesta_frontend/Pages/SignUp.dart';

import 'Pages/ResetPassword.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        '': (context) => Home(),
        'login': (context) => LoginPage(),
        '/signup': (context) => SignUp(),
        '/resetPassword': (context) => ResetPassword(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Home(),
      ),
    );
  }
}
