import 'package:flutter/material.dart';
import 'package:the_light_al_noor/features/Hadith/hadith_screen.dart';
import 'package:the_light_al_noor/main_screen/home_screen.dart';
import 'package:the_light_al_noor/onboarding/splash_screen.dart';

import 'features/PrayerTimings/prayer_timings.dart';
import 'features/todo_screens/surah_selection_screen.dart';


void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al-NOOR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => HomeScreen(),
        '/quran': (context) => SelectNumOfSurah(),
        '/prayer': (context) =>
            PrayerTimesPage(),
        '/qibla': (context) => Scaffold(),
        '/more': (context) => Scaffold(),
      },
      home: MySplashScreen(),
    );
  }
}


