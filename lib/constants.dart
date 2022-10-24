import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/navigation/nav_bar_item.dart';

/// ## App default colors
/// These colors are used to customize a lot of app content
class AppColors {
  static Color primaryColor = Colors.purple.shade400;
  static Color darkGrey = Colors.blueGrey.shade700;
  static Color navBarMenuBackgroundColor = Colors.grey.shade200;
}

/// Options to be used at the Bottom Navigation Bar
class NavBarOptions {
  List<NavBarItem> navBarPages = [
    NavBarItem(
      pageComponent: Container(),
      icon: Icons.home,
    ),
    NavBarItem(
      pageComponent: Container(),
      icon: Icons.home,
    ),
    NavBarItem(
      pageComponent: Container(),
      icon: Icons.home,
    ),
  ];
}

/// Options to be used at the Sidebar Drawer Menu
class SideBarOptions {
  BuildContext context;

  SideBarOptions(this.context);

  /// Title of the App
  String appTitle = 'My App Title';
  late List<SideBarItem> sideBarItems = [
    SideBarItem(
      text: 'Option 1',
      icon: Icons.star,
      onTap: () => Navigator.of(context).pop(),
    ),
    SideBarItem(
      text: 'Option 2',
      icon: Icons.star,
      onTap: () => Navigator.of(context).pop(),
    ),
    SideBarItem(
      text: 'Option 3',
      icon: Icons.star,
      onTap: () => Navigator.of(context).pop(),
    ),
  ];
}
