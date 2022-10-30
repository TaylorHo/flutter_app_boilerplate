import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/helpers/storage.dart';
import 'package:flutter_app_template/main.dart';

class AccessibilityHelper {
  Future<void> chooseAccessibilityOptions(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AccessibilityWidget();
      },
    );
  }
}

class AccessibilityWidget extends StatefulWidget {
  const AccessibilityWidget({super.key});

  @override
  State<AccessibilityWidget> createState() => _AccessibilityWidgetState();
}

class _AccessibilityWidgetState extends State<AccessibilityWidget> {
  int _fontSizeMultiplier = 100;

  @override
  void initState() {
    _fontSizeMultiplier =
        int.parse((fontSizeMultiplier * 100).toStringAsFixed(0));
    super.initState();
  }

  void _onAccessibilityChange(BuildContext context) {
    fontSizeMultiplier =
        double.parse((_fontSizeMultiplier / 100).toStringAsFixed(1));
    StorageHelper().saveData(
      'font_size',
      fontSizeMultiplier,
      box: 'user_settings',
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'accessibility.font_size'.tr(),
        style: TextStyle(fontSize: GeneralOptions().subtitleFontSize),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () => setState(() {
              _fontSizeMultiplier -= 10;
            }),
            child: const Icon(Icons.remove),
          ),
          Text(
            '$_fontSizeMultiplier%',
            style: TextStyle(fontSize: GeneralOptions().textFontSize),
          ),
          TextButton(
            onPressed: () => setState(() {
              _fontSizeMultiplier += 10;
            }),
            child: const Icon(Icons.add),
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
        TextButton(
          child: Text('save'.tr()),
          onPressed: () => _onAccessibilityChange(context),
        ),
      ],
    );
  }
}
