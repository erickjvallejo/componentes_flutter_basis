import 'package:flutter/material.dart';

/*
  This is a utility to centralize the icon and its method
 */

final _icon = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'tune': Icons.tune,
  'list': Icons.list,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icon[nombreIcono], color: Colors.blue);
}
