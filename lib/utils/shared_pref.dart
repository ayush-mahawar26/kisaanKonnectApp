import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  void setData(String key, String val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, val);
  }

  Future<String?> getData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<bool> removeKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
