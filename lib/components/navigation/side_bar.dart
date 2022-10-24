import 'package:flutter/material.dart';
import 'package:flutter_app_template/constants.dart';

/// ## Sidebar Menu Drawer
/// Sidebar menu options, configured at lib/contants.dart, sideBarItems
class SideBarComponent extends StatelessWidget {
  const SideBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 40),
              // Here goes the App Title on the Sidebar Drawer Menu
              child: Text(
                SideBarOptions(context).appTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          // Options, configured at lib/constants.dart file
          ...List<ListTile>.generate(
            SideBarOptions(context).sideBarItems.length,
            (index) => ListTile(
              leading: Icon(SideBarOptions(context).sideBarItems[index].icon),
              title: Text(SideBarOptions(context).sideBarItems[index].text),
              onTap: SideBarOptions(context).sideBarItems[index].onTap,
            ),
          ),
        ],
      ),
    );
  }
}
