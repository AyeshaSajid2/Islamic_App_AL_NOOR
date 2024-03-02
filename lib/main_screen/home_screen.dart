import 'package:flutter/material.dart';
import 'package:the_light_al_noor/global/colors.dart';

import 'home_screen_elements/date_screen.dart';
import 'home_screen_elements/prayer_tracker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor2,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 5), // Add spacing from the top
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                // alignment: Alignment(5, 50) ,
                height: 150, width: 125,
                // margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: TodayScreen(),
                ),
              ),


              Container(
                // alignment: Alignment(5, 50) ,
                height: 150, width: 125,
                // margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: TodayScreen(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Add spacing between widgets
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              child: PrayerTracker(),
            ),
          ),
        ],
      ),
    );
  }
}
