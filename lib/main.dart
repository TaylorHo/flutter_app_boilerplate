import 'package:flutter_app_template/helpers/navigation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/helpers/storage.dart';

double fontSizeMultiplier = 1;

/// General application changes
class GeneralOptions {
  String appTitle = 'Flutter Starter';
  double titleFontSize = 24 * fontSizeMultiplier;
  double subtitleFontSize = 18 * fontSizeMultiplier;
  double textFontSize = 16 * fontSizeMultiplier;
  double smallTextFontSize = 14 * fontSizeMultiplier;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await StorageHelper().initStorage();
  runApp(
    // Locale and language configuration
    // See more at https://pub.dev/packages/easy_localization
    EasyLocalization(
      useOnlyLangCode: true,
      supportedLocales: const [Locale('en'), Locale('pt'), Locale('es')],
      path: 'assets/translations',
      fallbackLocale: const Locale('pt'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GeneralOptions().appTitle,
      theme: ThemeData(
        primaryColor: Colors.grey[800],
      ),
      debugShowCheckedModeBanner: false,
      home: const NavigationHelper(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
