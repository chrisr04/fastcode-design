import 'package:flutter/material.dart';
import 'package:fastcode_design/views/home_view.dart';
import 'package:fastcode_design/views/main_view.dart';


Map<String, WidgetBuilder> getRoutes(RouteSettings settings){

  final Map<String, dynamic> params = settings.arguments;

  return {
    'main': (BuildContext context) => MainView(),
    'home': (BuildContext context) => HomeView(),
  };
}

MaterialPageRoute<dynamic> generateRoutes(RouteSettings settings) {
  Map<String, WidgetBuilder> routes = getRoutes(settings);
  WidgetBuilder builder = routes[settings.name];
  return MaterialPageRoute(settings: settings, builder: (BuildContext context) => builder(context));
}