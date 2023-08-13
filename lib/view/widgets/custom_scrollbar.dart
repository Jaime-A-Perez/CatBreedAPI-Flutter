import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomScrollbar extends StatelessWidget {
  const CustomScrollbar({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoScrollbar(child: child);
    } else {
      return Scrollbar(child: child);
    }
  }
}