import 'dart:convert';

List<FakeCharacterModel> fakeCharacterModelFromJson(String str) => List<FakeCharacterModel>.from(json.decode(str).map((x) => FakeCharacterModel.fromJson(x)));

String fakeCharacterModelToJson(List<FakeCharacterModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeCharacterModel {
    int id;
    String firstName;
    String lastName;
    String fullName;
    String title;
    String family;
    String image;
    String imageUrl;

    FakeCharacterModel({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.fullName,
        required this.title,
        required this.family,
        required this.image,
        required this.imageUrl,
    });

    factory FakeCharacterModel.fromJson(Map<String, dynamic> json) => FakeCharacterModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        title: json["title"],
        family: json["family"],
        image: json["image"],
        imageUrl: json["imageUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "fullName": fullName,
        "title": title,
        "family": family,
        "image": image,
        "imageUrl": imageUrl,
    };
}
