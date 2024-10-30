import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DarkLogic extends ChangeNotifier{
  int _themeIndex = 0;
  int get themeIndex => _themeIndex;

  final _cache = const FlutterSecureStorage();
  final _key = "DarkLogic";

  Future readCache() async{
    String? value = await _cache.read(key: _key);
    _themeIndex = int.parse(value ?? '0');
    notifyListeners();
  }

  void changeToSystem(){
    _themeIndex = 0;
    _cache.write(key: _key, value: _themeIndex.toString());
    notifyListeners();
  }

  void changeToLight(){
    _themeIndex = 1;
    _cache.write(key: _key, value: _themeIndex.toString());
    notifyListeners();
  }

  void changeToDark(){
    _themeIndex = 2;
    _cache.write(key: _key, value: _themeIndex.toString());
    notifyListeners();
  }
}