import 'package:flutter/material.dart';


final Map<String,Color> _colors = {
  'cyan': Colors.cyanAccent[400],
  'yellow': Colors.yellow[700],
  'red': Colors.red[600]
};

Color getColor(String colorName){

  return _colors[colorName];
}