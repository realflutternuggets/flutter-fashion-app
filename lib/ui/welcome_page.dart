
import 'package:fashionapp/ui/favorite_page.dart';
import 'package:fashionapp/ui/home_page.dart';
import 'package:fashionapp/ui/settings_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  //menu index selected
  int selectedIndex = 0;

  //List of the menu screens
  List<Widget> _screens = [
    HomePage(),
    FavoritePage(),
    SettingsPage(),
  ];

  //Function to update menu index
  void updateMenuIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/menu.png', height: 40.0,),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset('assets/search.png'),
          )
        ],
      ),
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Color(0xffAA78E9),
        onTap: updateMenuIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
