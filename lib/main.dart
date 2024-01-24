import 'package:animated_toggle_switch/home_screen.dart';
import 'package:flutter/material.dart';
void  main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      title: "Animated Toggle",
      home: HomeScreen(),
    );
  }
}
