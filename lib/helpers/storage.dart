import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

/// ## Helper to storage NoSQL data
/// Ensure that StorageHelper().initStorage() was called before using it
class StorageHelper {
  /// Current opened Lazy Box
  LazyBox? openedBox;

  /// Current opened box name (by default it's equals to the defaultStorageBox)
  String currentBoxName = 'storage';

  /// The default box name, to be used if you don't want to use a custom one.
  String defaultStorageBox = 'storage';

  /// ## Starts the Storage
  /// Starts Hive storage at default application folder
  Future<void> initStorage() async {
    if (!kIsWeb) {
      Directory storagePath = await getApplicationDocumentsDirectory();
      Hive.init(storagePath.path);
    }
  }

  /// ### Save data
  /// Required to specify a [key] to store/retrieve stored data, and the [data] you want to save.
  ///
  /// Also, you can specify a custom box to save your data (default is 'storage').
  Future<bool> saveData(String key, dynamic data, {String? box}) async {
    if (data == null) return false;

    await _openBox(box ?? defaultStorageBox);

    try {
      await openedBox!.put(key, data);
      return true;
    } catch (e) {
      throw Exception(
          'The Storage helper only store primitive data types. If you need other types, take a look at Hive types Adapters: https://docs.hivedb.dev/#/custom-objects/type_adapters');
    }
  }

  /// ### Retrieve data
  /// Required to specify a [key] of wich data you want to retrieve.
  ///
  /// Also, you can specify a custom box to search in (default is 'storage').
  Future<dynamic> getData(String key, {String? box}) async {
    await _openBox(box ?? defaultStorageBox);

    dynamic data = await openedBox!.get(key, defaultValue: null);
    return data;
  }

  /// ### Open/Start the lazy box
  _openBox(String box) async {
    if (openedBox == null) {
      openedBox = await Hive.openLazyBox(box);
    } else if (currentBoxName != box) {
      currentBoxName = box;
      openedBox!.close();
      openedBox = await Hive.openLazyBox(box);
    }
  }
}
