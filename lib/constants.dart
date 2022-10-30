import 'package:flutter/material.dart';
import 'package:flutter_app_template/components/navigation/nav_bar_item.dart';
import 'package:flutter_app_template/helpers/accessibility.dart';
import 'package:flutter_app_template/helpers/language.dart';

/// App default colors
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
      icon: Icons.reorder,
    ),
    NavBarItem(
      pageComponent: Container(),
      icon: Icons.home,
    ),
    NavBarItem(
      pageComponent: Container(),
      icon: Icons.settings,
    ),
  ];
}

/// Options to be used at the Sidebar Drawer Menu
class SideBarOptions {
  BuildContext context;

  SideBarOptions(this.context);

  /// Title of the App
  late List<SideBarItem> sideBarItems = [
    SideBarItem(
      text: 'menu_options.option1', // Easy Localization Key of the option
      icon: Icons.star,
      onTap: () => Navigator.of(context).pop(),
    ),
    SideBarItem(
      text: 'menu_options.option2', // Easy Localization Key of the option
      icon: Icons.star,
      onTap: () => Navigator.of(context).pop(),
    ),
    SideBarItem(
      text: 'menu_options.language', // Easy Localization Key of the option
      icon: Icons.translate,
      onTap: () => LanguageHelper().chooseLanguage(context),
    ),
    SideBarItem(
      text: 'menu_options.accessibility', // Easy Localization Key of the option
      icon: Icons.accessibility,
      onTap: () => AccessibilityHelper().chooseAccessibilityOptions(context),
    ),
  ];
}

/// Array of available language options.
class LanguageOptions {
  /// Available languages.
  ///
  /// To add more, add a language json file at /assets/translations/ folder, with the language code as name.
  /// Also, add a flag to /assets/flags/, and then populate this array.
  List<LanguageOption> languages = [
    LanguageOption(
      flag: 'assets/flags/usa.png',
      language: 'English',
      locale: const Locale('en'),
    ),
    LanguageOption(
      flag: 'assets/flags/brazil.png',
      language: 'Português',
      locale: const Locale('pt'),
    ),
    LanguageOption(
      flag: 'assets/flags/spain.png',
      language: 'Español',
      locale: const Locale('es'),
    ),
  ];
}

/// Single language option, used to show a language on the pop-up to change the current app language.
class LanguageOption {
  /// Path from where the language flag image is
  String flag;

  /// The name of the Language, to be showed at the LanguageHelper. This string isn't a Easy Localization key,
  /// because it's better to show the language name as the intended language.
  String language;

  /// The Locale of the anguage. Just the languageCode, without the countryCode.
  Locale locale;

  LanguageOption({
    required this.language,
    required this.flag,
    required this.locale,
  });
}
