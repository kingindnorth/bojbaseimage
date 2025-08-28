import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app_translations.dart';

class TranslationService extends Translations {
  static Map<String, Map<String, String>> _localizedKeys = {};

  static Future<void> init() async {
    _localizedKeys = {
      AppLocales.en: await _loadJson('assets/locales/en_US.json'),
      AppLocales.ms: await _loadJson('assets/locales/ms_MY.json'),
      AppLocales.zh: await _loadJson('assets/locales/zh_CN.json'),
    };
  }

  static Future<Map<String, String>> _loadJson(String path) async {
    final data = await rootBundle.loadString(path);
    final Map<String, dynamic> map = json.decode(data);
    return map.map((k, v) => MapEntry(k, v.toString()));
  }

  @override
  Map<String, Map<String, String>> get keys => _localizedKeys;
}
