import 'package:flutter/material.dart';
import 'package:packages_tester_updated/home/home_page.dart';
import 'package:packages_tester_updated/home/stack_overflow_test_page.dart';
import './routes.dart' as routes;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      routes: routes.routes,
      home: const HomePage(),
      //home: StackOverflowTestPage(),
      debugShowCheckedModeBanner: false
    );
  }
}