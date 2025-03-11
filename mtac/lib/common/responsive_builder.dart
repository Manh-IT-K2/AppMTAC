import 'package:flutter/material.dart';
import 'package:mtac/utils/theme_text.dart';

// Key? key
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.portrait,
    required this.landscape,

    });
  final Widget portrait;
  final Widget landscape;
  @override
  Widget build(BuildContext context) {
    return context.orientation == Orientation.portrait ? portrait : landscape;
  }
}
