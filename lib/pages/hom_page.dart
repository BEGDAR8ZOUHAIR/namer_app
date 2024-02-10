import 'package:flutter/material.dart';
import 'generator_page.dart';
import 'favorites_page.dart';
import '../widgets/bottom_navigation.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Namer App')),
      drawer: Drawer(
        child: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                    Navigator.pop(context);
                  },
                  iconColor: Colors.white,
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Favorites'),
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                    Navigator.pop(context);
                  },
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
        onItemTapped: (idx) {
          setState(() {
            selectedIndex = idx;
          });
        },
      ),
    );
  }
}
