import 'package:flutter/material.dart';

/// Bottom navigation bar single page/item
class NavBarItem {
  /// Page component
  Widget pageComponent;

  /// Icon displayed at the bottom navigation bar that corresponds to the desired pageComponent
  IconData icon;

  /// Custom active color (page selected)
  Color? activeColor;

  /// Custom inactive color (page is not selected)
  Color? inactiveColor;

  NavBarItem({
    required this.pageComponent,
    required this.icon,
    this.activeColor,
    this.inactiveColor,
  });
}

/// Sidebar Drawer Menu single list item
class SideBarItem {
  /// Option text to be displayed
  String text;

  /// Icon for the desired option
  IconData icon;

  /// Function to be executed on option tap
  Function()? onTap;

  SideBarItem({
    required this.text,
    required this.icon,
    this.onTap,
  });
}
