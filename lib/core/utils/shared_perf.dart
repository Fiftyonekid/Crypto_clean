import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _preferences;
  static const _KeyCoin = 'coinIndex';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setCoinIndex(List<String> index) async =>
      await _preferences!.setStringList(_KeyCoin, index);
  static List<String>? getFavoiteCoinList() =>
      _preferences!.getStringList(_KeyCoin) ?? [];
}
