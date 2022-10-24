import 'package:flutter/material.dart';
import 'package:flutter_app_template/constants.dart';

/// AppBar with button to show the Scaffold (Sidebar Drawer Menu)
class AppBarComponent extends StatelessWidget with PreferredSizeWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(
              Icons.sort,
              color: AppColors.darkGrey,
              size: 28,
            ),
            iconSize: 28,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
