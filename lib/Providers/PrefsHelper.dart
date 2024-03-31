import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  static late SharedPreferences prefs;
  static String? getLanguage(){
    return prefs.getString("lang");
  }
  static saveLanguage(String language)async{
    await prefs.setString("lang", language);
  }
  static saveTheme(String mode)async{
    await prefs.setString("mode", mode);
  }
  static String getMode(){
    return prefs.getString("mode")??"light";
  }
}