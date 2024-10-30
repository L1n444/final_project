import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_project/language/language_logic.dart';

class AboutUsScreen extends StatelessWidget {
  final List<Member> members = [
    Member(name: "Heng Huylong", imageUrl: "photos/huylong.png"),
    Member(name: "Lim Lina", imageUrl: "photos/lina.png"),
    Member(name: "Savuth Rithysal", imageUrl: "photos/rithysal.png"),
    Member(name: "Thorn Monita", imageUrl: "photos/monita.png"),
  ];

  AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final language = context.watch<LanguageLogic>().lang;

    return Scaffold(
      appBar: AppBar(
        title: Text(language.aboutUs),
        backgroundColor: isDarkMode ? Colors.black : Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Text(
              '${language.appName} provides character information and details.\n${language.appName} is built using Flutter!',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 20),
          // Add Team Members heading
          Center(
            child: Text(
              language.teamMembers,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          // List of members with spacing
          ...members.map((member) => _buildMemberTile(member)),
        ],
      ),
    );
  }

  Widget _buildMemberTile(Member member) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(member.imageUrl),
          radius: 30,
        ),
        title: Text(member.name),
      ),
    );
  }
}

class Member {
  final String name;
  final String imageUrl;
  Member({required this.name, required this.imageUrl});
}
