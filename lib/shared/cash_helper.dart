import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{
  static SharedPreferences? sharedPreferences ;
  static init()async{
    sharedPreferences =await SharedPreferences.getInstance();
  }
  static Future <dynamic>saveData({
    required String key,
    required dynamic value,
})async{
    if(value is String)return await sharedPreferences?.setString(key, value);
    if(value is int)return await sharedPreferences?.setInt(key, value);
    if(value is double)return await sharedPreferences?.setDouble(key, value);
    return sharedPreferences?.setBool(key, value);

  }
  static dynamic getData({
  required String key,
}){
    return sharedPreferences?.get(key);
  }
}