import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_app_template/constants.dart';
import 'package:flutter_app_template/components/navigation/app_top_bar.dart';
import 'package:flutter_app_template/components/navigation/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/navigation/nav_bar_item.dart';
import 'package:flutter_app_template/helpers/storage.dart';
import 'package:flutter_app_template/main.dart';

/// ## Bottom navigation bar
/// Options can be configured at lib/constants.dart, under navBarPages option
class NavigationHelper extends StatefulWidget {
  const NavigationHelper({super.key});

  @override
  State<NavigationHelper> createState() => _NavigationHelperState();
}

class _NavigationHelperState extends State<NavigationHelper> {
  int _currentIndex = 1;
  final List<NavBarItem> _pages = NavBarOptions().navBarPages;

  @override
  void initState() {
    _verifySavedLanguage();
    _verifyFontSizePreferences();
    super.initState();
  }

  /// Verify if there's any language saved and, if exists, apply this language.
  void _verifySavedLanguage() async {
    dynamic response = await StorageHelper().getData(
      'language',
      box: 'user_settings',
    );
    if (response != null) {
      // ignore: use_build_context_synchronously
      context.setLocale(Locale(response));
    }
  }

  /// Verify if the user have any preferences saved on the device storage.
  void _verifyFontSizePreferences() async {
    dynamic response = await StorageHelper().getData(
      'font_size',
      box: 'user_settings',
    );
    if (response != null && response != 1) {
      fontSizeMultiplier = response;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarComponent(),
      appBar: const AppBarComponent(),
      backgroundColor: Colors.grey.shade200,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _pages[_currentIndex].pageComponent,
        ),
      ),
      bottomNavigationBar: CircleNavBar(
        activeIcons: List<Icon>.generate(
          _pages.length,
          (index) => Icon(_pages[index].icon,
              color: _pages[index].activeColor ?? AppColors.primaryColor),
        ),
        inactiveIcons: List<Icon>.generate(
          _pages.length,
          (index) => Icon(_pages[index].icon,
              color: _pages[index].inactiveColor ?? AppColors.darkGrey),
        ),
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        initIndex: 1,
        onChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        shadowColor: Colors.transparent,
        elevation: 10,
        iconCurve: Curves.ease,
        iconDurationMillSec: 400,
      ),
    );
  }
}
