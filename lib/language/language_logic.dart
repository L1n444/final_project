import 'package:flutter/material.dart';
import 'language_constant.dart';

class LanguageLogic extends ChangeNotifier{
  int _languageIndex = 0;
  int get languageIndex => _languageIndex;

  Language _lang = Language();
  Language get lang => _lang;

  void changeToKhmer(){
    _languageIndex = 0;
    _lang = langList[_languageIndex];
    notifyListeners();
  }

  void changeToEnglish(){
    _languageIndex = 1;
    _lang = langList[_languageIndex];
    notifyListeners();
  }  
}
