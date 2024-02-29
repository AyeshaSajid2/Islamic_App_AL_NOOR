import 'package:flutter/material.dart';
import 'package:the_light_al_noor/features/Hadith/hadith_screen.dart';

import '../home_screen.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('Quran', style: TextStyle(color: Colors.black)),
    Text('Prayer', style: TextStyle(color: Colors.black)),
    Text('Qibla', style: TextStyle(color: Colors.black)),
    Text('More', style: TextStyle(color: Colors.black)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HadithScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // elevation: 8, // Adjust elevation as needed
      color: Colors.cyan, // Set background color to cyan
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            label: 'Prayer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Qibla',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber, // Set the selected item color to amber
        unselectedItemColor: Colors.white, // Set the unselected item color
        onTap: _onItemTapped,
      ),
    );
  }
}
