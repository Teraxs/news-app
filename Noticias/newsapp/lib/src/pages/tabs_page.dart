import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:newsapp/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _Navegationmodel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigation(),
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_Navegationmodel>(context);

    return BottomNavigationBar(
        currentIndex: navigationModel.actualPage,
        onTap: (i) => navigationModel.actualPage = i,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'For You',
              tooltip: 'For You'),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: 'Trending', tooltip: 'Trending'),
        ]);
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegationModel = Provider.of<_Navegationmodel>(context);

    return PageView(
      controller: navegationModel.pageController,
      // physics: const BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[
        // Tab 1
        Tap1Page(),
        // Tab 2
        Tab2Page(),
      ],
    );
  }
}

class _Navegationmodel with ChangeNotifier {
  int _actualPage = 0;
  final PageController _pageController = PageController();

  int get actualPage => _actualPage;

  set actualPage(int value) {
    _actualPage = value;

    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => _pageController;
}
