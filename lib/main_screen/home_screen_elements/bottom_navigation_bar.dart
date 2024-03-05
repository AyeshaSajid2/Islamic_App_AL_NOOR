import 'package:flutter/material.dart';
import 'package:the_light_al_noor/global/colors.dart';
 // Import your home screen

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle onclick actions for each index
    switch(index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/quran');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/prayer');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/qibla');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/more');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.cyan,
      child: WillPopScope(
        onWillPop: () async {
          // Ensure back button always navigates to the home screen
          if (_selectedIndex != 0) {
            setState(() {
              _selectedIndex = 0;
            });
            return false;
          }
          return true;
        },
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: primaryColor),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book, color: primaryColor),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm, color: primaryColor),
              label: 'Prayer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mosque_sharp, color: primaryColor),
              label: 'Qibla',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'More',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: secondaryColor2,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
