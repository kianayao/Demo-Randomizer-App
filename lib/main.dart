import 'package:flutter/material.dart';
import 'package:cs4750_final_project/random_num.dart';
import 'package:cs4750_final_project/random_custom.dart';

void main() => runApp(const MyApp());
//int selected_index = 0;

MaterialColor theme_c = Colors.blueGrey;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Generator',
      theme: ThemeData(
        primarySwatch: theme_c,
      ),
      home: num_gen_page(title: 'Number Generator'),
    );
  }
}