import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/constants.dart';
import 'package:flutter_app_template/helpers/storage.dart';
import 'package:flutter_app_template/main.dart';

class LanguageHelper {
  /// Handle the language change by changing the language, saving it to the storage and closing the pop-up.
  void _onLanguageChange(BuildContext context, Locale locale) {
    context.setLocale(locale);
    StorageHelper().saveData(
      'language',
      locale.languageCode,
      box: 'user_settings',
    );
    Navigator.pop(context);
  }

  /// Open the modal to choose one of the available languages.
  /// To add more languages, take a look at LanguageOptions on the lib/constants.dart file
  Future<void> chooseLanguage(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'menu_options.language'.tr(),
            style: TextStyle(fontSize: GeneralOptions().subtitleFontSize),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: LanguageOptions()
                      .languages
                      .map(
                        (e) => ListTile(
                          leading: Image.asset(
                            e.flag,
                            width: 40,
                          ),
                          title: Text(
                            e.language,
                            style: TextStyle(
                              fontSize: GeneralOptions().textFontSize,
                            ),
                          ),
                          onTap: () => _onLanguageChange(context, e.locale),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('cancel'.tr()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
