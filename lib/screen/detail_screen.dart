import 'package:final_project/async/fakecharacter_model.dart';
import 'package:final_project/language/language_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final FakeCharacterModel character;
  const DetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final language = context.watch<LanguageLogic>().lang;

    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName),
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                character.imageUrl,
                width: 200,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${language.firstName}: ${character.firstName}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              '${language.lastName}: ${character.lastName}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              '${language.fullName}: ${character.fullName}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              '${language.title}: ${character.title}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              '${language.family}: ${character.family}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}