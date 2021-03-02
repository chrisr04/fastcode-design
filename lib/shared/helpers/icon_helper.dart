import 'package:flutter/material.dart';

IconData getOutlineIcon(int index){
  IconData oldIcon = Icons.home;
  switch (index) {
    case 0:
      oldIcon = Icons.mic_none;
      break;
    case 1:
      oldIcon = Icons.textsms_outlined;
      break;
    case 2:
      oldIcon = Icons.home_outlined;
      break;
    case 3:
      oldIcon = Icons.favorite_outline;
      break;
    case 4:
      oldIcon = Icons.search_outlined;
      break;
  }
  return oldIcon;
}

IconData getFilledIcon(index){

  IconData newIcon = Icons.home;
  switch (index) {
    case 0:
      newIcon = Icons.mic;
      break;
    case 1:
      newIcon = Icons.textsms;
      break;
    case 2:
      newIcon = Icons.home;
      break;
    case 3:
      newIcon = Icons.favorite;
      break;
    case 4:
      newIcon = Icons.search;
      break;
  }
  return newIcon;
}