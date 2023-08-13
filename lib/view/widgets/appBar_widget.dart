import 'package:flutter/material.dart';


class AppBarCat extends StatelessWidget with PreferredSizeWidget {
  const AppBarCat({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context);
    return AppBar(
        title: Text(title!, style: theme.textTheme.displaySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),),
        backgroundColor: theme.primaryColor,
      centerTitle: true);
  }
  
  @override
  Size get preferredSize => const Size.fromHeight( 55);
}


