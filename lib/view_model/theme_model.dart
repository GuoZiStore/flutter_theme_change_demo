import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_change/manager/storage_manager.dart';
import 'package:theme_change/model/value.dart';

class ThemeModel extends ChangeNotifier {
  //当前主题颜色
  String _themeColor;
  ThemeModel() {
    //获取主题色
    _themeColor =
        StorageManager.sharedPreferences.getString('key_theme_color') ?? 'blue';
  }
  String getColor(){
    String colorKey=_themeColor;
    return colorKey;
  }
  void switchTheme(String themeColor){
      _themeColor=themeColor;
      notifyListeners();
      StorageManager.sharedPreferences.setString('key_theme_color', _themeColor);
  }
  themeData(){
    var themeColor = _themeColor;
    var themeData=ThemeData(
      primaryColor:themeColorMap[themeColor],
      accentColor:themeColorMap[themeColor],
    );
    return themeData;
  }
}
