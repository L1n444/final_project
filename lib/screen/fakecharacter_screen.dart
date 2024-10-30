import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/language/language_constant.dart';
import 'package:final_project/language/language_logic.dart';
import 'package:final_project/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../async/dark_logic.dart';
import '../async/fakecharacter_logic.dart';
import '../async/fakecharacter_model.dart';

class FakeCharacterScreen extends StatefulWidget {
  const FakeCharacterScreen({super.key});

  @override
  State<FakeCharacterScreen> createState() => _FakeCharacterScreenState();
}

class _FakeCharacterScreenState extends State<FakeCharacterScreen> {

  Language _language = Khmer();
  int _languageIndex = 0;

  @override
  Widget build(BuildContext context) {
    _language = context.watch<LanguageLogic>().lang;
    _languageIndex = context.watch<LanguageLogic>().languageIndex;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(_language.appName), // Dynamically set title based on language
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _buildBody(),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    int themeIndex = context.watch<DarkLogic>().themeIndex;
    int currentLanguageIndex = context.watch<LanguageLogic>().languageIndex;

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Icon(Icons.face)),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title: Text(_language.systemMode),
            onTap: () {
              context.read<DarkLogic>().changeToSystem();
            },
            trailing: themeIndex == 0 ? const Icon(Icons.check) : null,
          ),
          ListTile(
            leading: const Icon(Icons.light_mode),
            title: Text(_language.lightMode),
            onTap: () {
              context.read<DarkLogic>().changeToLight();
            },
            trailing: themeIndex == 1 ? const Icon(Icons.check) : null,
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: Text(_language.darkMode),
            onTap: () {
              context.read<DarkLogic>().changeToDark();
            },
            trailing: themeIndex == 2 ? const Icon(Icons.check) : null,
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(_language.toKhmer),
            onTap: () {
              context.read<LanguageLogic>().changeToKhmer();
            },
            trailing: currentLanguageIndex == 0 ? const Icon(Icons.check) : null, // Check for Khmer
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(_language.toEnglish),
            onTap: () {
              context.read<LanguageLogic>().changeToEnglish();
            },
            trailing: currentLanguageIndex == 1 ? const Icon(Icons.check) : null, // Check for English
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    bool loading = context.watch<FakecharacterLogic>().loading;
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    String? error = context.watch<FakecharacterLogic>().error;

    if (error != null) {
      return _buildError(error);
    }

    List<FakeCharacterModel> characterList =
        context.watch<FakecharacterLogic>().characterList;
    return _buildListView(characterList);
  }

  Widget _buildError(String error) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error),
          ElevatedButton(
            onPressed: () async {
              context.read<FakecharacterLogic>().setLoading();
              await Future.delayed(const Duration(seconds: 1));
              context.read<FakecharacterLogic>().read();
            },
            child: const Text("RETRY"),
          ),
        ],
      ),
    );
  }

  Widget _buildListView(List<FakeCharacterModel> items) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<FakecharacterLogic>().read();
      },
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildItem(items[index]);
        },
      ),
    );
  }

  Widget _buildItem(FakeCharacterModel item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(character: item),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: Text(
            item.fullName,
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Column(
            children: [
              SizedBox(
                width: 200, // Set a fixed width
                height: 200, // Set a fixed height
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl,
                  placeholder: (context, url) => Container(
                    height: 200,
                    width: 200,
                    color: Colors.grey,
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 200,
                    width: 200,
                    color: Colors.grey[900],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}