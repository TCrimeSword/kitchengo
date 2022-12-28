import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key, this.title, required this.bgColor});
  final String? title;
  final Color bgColor;
  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title ?? ''),
      backgroundColor: widget.bgColor,
    );
  }
}
