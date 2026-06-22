import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:mt_6_dz1/features/quiz/data/model/Quiz_Model.dart';
import 'package:mt_6_dz1/features/quiz/data/repositoryi/repo.dart';
import 'package:mt_6_dz1/features/quiz/ui/Preferences.dart';
import 'package:mt_6_dz1/features/quiz/ui/history_screen.dart';
import 'package:mt_6_dz1/features/quiz/ui/items.dart';
import 'package:mt_6_dz1/features/quiz/ui/main.dart';

class QuizBarPage extends StatefulWidget {
  const QuizBarPage({super.key});

  @override
  State<QuizBarPage> createState() => _QuizBarPage(list: []);
}

class _QuizBarPage extends State<QuizBarPage> {
  final List<QuizModel> list;
  final repo = Repo();

  late final List<Widget> listPage;

  int currentIndex = 0;
  String title = 'Home';

  _QuizBarPage({required this.list});

  @override
  void initState() {
    super.initState();
    listPage = <Widget>[
      Quizpage(repo: repo),
      HistoryScreen(repo: repo),
      QuizPreferences(repo: repo),
    ];
  }

  void _onItemTapped(int index, String title) {
    setState(() {
      currentIndex = index;
      this.title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: listPage),
      bottomNavigationBar: GNav(
        tabs: items,
        activeColor: Colors.black,
        color: Colors.white,
        gap: 7,
        padding: const EdgeInsets.all(18),
        backgroundColor: const Color(0xFFF5F5F5),
        selectedIndex: currentIndex,
        onTabChange: (index) {
          _onItemTapped(index, items[index].text);
        },
      ),
    );
  }
}
