import 'package:flutter/material.dart';

import 'package:funfoodapp/screens/settings/setting.dart';

import '../l10n/app_localizations.dart';
import 'articles/Articles.dart';
import 'complete/Complete.dart';
import 'home/Home.dart';

class HomeLayout extends StatefulWidget {
  static String routeName = "home-layout";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  // تم إزالة const من هنا
  List<Widget> screens = [
    Home(),
    Complete(),
    Articles(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF174AA3),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage("assets/icon/home.png")),
            label: localizations.home,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage("assets/icon/com.png")),
            label: localizations.complete,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage("assets/icon/arc.png")),
            label: localizations.articles,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(AssetImage("assets/icon/settings.png")),
            label: localizations.settings,
          ),
        ],
      ),
    );
  }
}
