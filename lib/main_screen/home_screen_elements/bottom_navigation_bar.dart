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
        _showMoreMenu();
        break;
      default:
        break;
    }
  }
  void _showMoreMenu() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Ramzan'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/ramzan');
                },
              ),
              ListTile(
                leading: Icon(Icons.alarm),
                title: Text('Daily Supplications'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/daily_supplications');
                },
              ),
              ListTile(
                leading: Icon(Icons.format_list_bulleted),
                title: Text('Asma ul-Husna'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/asma_ul_husna');
                },
              ),
              ListTile(
                leading: Icon(Icons.format_quote),
                title: Text('Hadees'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/hadees');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Material(
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
                icon: Icon(Icons.more_horiz, color: primaryColor,),
                label: 'More',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: secondaryColor2,
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

