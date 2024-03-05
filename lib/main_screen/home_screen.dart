import 'package:flutter/material.dart';
import 'package:the_light_al_noor/global/colors.dart';
import 'package:the_light_al_noor/main_screen/home_screen_elements/bottom_navigation_bar.dart';
import 'package:the_light_al_noor/main_screen/home_screen_elements/remaining_activity.dart';
import 'package:the_light_al_noor/main_screen/home_screen_elements/today_ayah_fetch_screen.dart';

import 'home_screen_elements/collection.dart';
import 'home_screen_elements/date_screen.dart';
import 'home_screen_elements/prayer_tracker.dart';
import 'home_screen_elements/ramdan_screen.dart';
import 'home_screen_elements/today_ayah.dart';

class HomeScreen extends StatelessWidget {
  final String? selectedAyah;
  const HomeScreen({Key? key, this.selectedAyah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TodayScreen(),
        elevation: 20,
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            RemainingActivity(),

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
               // elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: Categories(),
              ),
            ),

            SizedBox(height: 20,),
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
                //elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: RamzanPage(),
              ),
            ),
            SizedBox(height: 20,),
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
                //elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: PrayerTracker(),
              ),
            ),
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
                //elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: selectedAyah != null
                    ? Text(selectedAyah!) // Display the selected ayah
                    : CircularProgressIndicator(),

              ),
            ),

          ],
           ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
