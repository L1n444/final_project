import 'package:final_project/async/fakecharacter_logic.dart';
import 'package:final_project/language/language_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final characterLogic = Provider.of<FakecharacterLogic>(context);
    final characterList = characterLogic.characterList
        .where((character) => character.fullName.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
    final language = context.watch<LanguageLogic>().lang;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
        foregroundColor: Colors.white,
        title: Text(language.search),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: language.searchHint, // Use localized hint text
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: _searchQuery.isEmpty
          ? Center(child: Text(language.bodyMessage))
          : characterList.isEmpty
              ? Center(child: Text(language.errorMessage))
              : ListView.builder(
                  itemCount: characterList.length,
                  itemBuilder: (context, index) {
                    final character = characterList[index];
                    return ListTile(
                      title: Text(character.fullName),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(character: character),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }
}
