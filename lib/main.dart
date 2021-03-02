import 'package:fastcode_design/routes.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fastcode Design',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoutes,
      initialRoute: 'main',
    );
  }
}