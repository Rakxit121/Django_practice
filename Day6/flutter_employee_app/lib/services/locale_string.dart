import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LocaleString extends Translations {
  final Map<String, Map<String, String>> _localizedStrings = {};

  LocaleString() {
    loadTranslations();
  }

  Future<void> loadTranslations() async {
    _localizedStrings['en_US'] = await _loadJson('assets/lang/en.json');
    _localizedStrings['np'] = await _loadJson('assets/lang/np.json');
  }

  Future<Map<String, String>> _loadJson(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    return Map<String, String>.from(json.decode(jsonString));
  }

  @override
  Map<String, Map<String, String>> get keys => _localizedStrings;
}
