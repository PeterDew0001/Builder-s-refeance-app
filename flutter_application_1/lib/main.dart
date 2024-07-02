import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeController>(
      create: (_) => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (context, themeController, child) {
          return MaterialApp(
            title: 'My App',
            theme: themeController.getThemeData(themeController.isDarkModeEnabled),
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}




class MyHomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyHomePage> {
  int _selectedIndex = 0; // Default index

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    SavedPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeController().getThemeData(ThemeController().isDarkModeEnabled),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),        
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.save),
              label: 'Saved',
            ),
            BottomNavigationBarItem( // New item for Settings
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).hintColor,
        ),
      ),
    );
  }
}


class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved"),
      ),
      body: const Center(
        child: Text("Saved Page"),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Center(
        child: Text("Home Page"),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: const Center(
        child: Text("Search Page"),
      ),
    );
  }
}


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.display_settings),
            title: Text("Display"),
            onTap: () {
              // Handle language settings
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DisplaySettingsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Preferances"),
            onTap: () {
              // Handle notification settings
              DisplaySettingsPage();
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Account"),
            onTap: () {
              // Handle account settings
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text("Privacy"),
            onTap: () {
              // Handle privacy settings
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Help & Support"),
            onTap: () {
              // Handle help and support settings
            },
          ),
        ],
      ),
    );
  }
}


class DisplaySettingsPage extends StatelessWidget {
  const DisplaySettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Settings"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Dark Mode"),
            trailing: Switch(
              value: ThemeController().isDarkModeEnabled,
              onChanged: (value) {
                ThemeController().toggleDarkMode(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}