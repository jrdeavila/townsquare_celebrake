import 'package:flutter/widgets.dart';

class ActivitySidebarItemModel {
  final String title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isButton;

  final VoidCallback onTap;

  ActivitySidebarItemModel({
    required this.title,
    required this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.isButton = false,
  });
}
