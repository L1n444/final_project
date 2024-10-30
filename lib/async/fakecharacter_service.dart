import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'fakecharacter_model.dart';

class FakecharacterService {
  static Future<List<FakeCharacterModel>> getAPI() async {
    String url = "https://thronesapi.com/api/v2/Characters";
    http.Response res = await http.get(Uri.parse(url));
    return compute(fakeCharacterModelFromJson, res.body);
  }
}