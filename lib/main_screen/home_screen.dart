import 'package:flutter/material.dart';
import 'package:the_light_al_noor/global/colors.dart';

import 'home_screen_elements/date_screen.dart';
import 'home_screen_elements/prayer_tracker.dart';
import 'home_screen_elements/remaining_activity.dart';

import 'home_screen_elements/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor2,
      appBar: AppBar(
       title: TodayScreen(),
        backgroundColor: primaryColor,
        // elevation: 40,
      centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Add spacing from the top

          const Material(
              elevation: 20,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
                topLeft: Radius.zero,
                topRight: Radius.zero,
              ),
              child: RemainingActivity()

          ),

          const SizedBox(height: 20), // Add spacing between widgets
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Material(
              elevation: 40,
              borderRadius: BorderRadius.circular(20),
              child: const PrayerTracker(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
