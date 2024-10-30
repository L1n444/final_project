import 'package:flutter/material.dart';
import 'fakecharacter_model.dart';
import 'fakecharacter_service.dart';

class FakecharacterLogic extends ChangeNotifier {
  List<FakeCharacterModel> _characterList = [];
  List<FakeCharacterModel> get characterList => _characterList;

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  // Method to start loading state
  void setLoading() {
    _loading = true;
    notifyListeners();
  }

  // Method to finish loading state and notify listeners
  void clearLoading() {
    _loading = false;
    notifyListeners();
  }

  // Read characters from the API
  Future<void> read() async {
    setLoading(); // Set loading to true and notify listeners
    try {
      _characterList = await FakecharacterService.getAPI();
      _error = null; // Clear any previous error
    } catch (e) {
      _error = e.toString(); // Capture the error
    } finally {
      clearLoading(); // Set loading to false and notify listeners
    }
  }
}
