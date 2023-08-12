import 'package:flutter/material.dart';
import 'package:test_pragma/view/screens/screens.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (BuildContext context) => const LandingScreen(), 
  'detailScreen': (BuildContext context) => const DetailScreen(),
};