

import 'package:flutter/material.dart';
// import 'package:adhan_dart/adhan_dart.dart';
import 'package:intl/intl.dart';

import '../../../global/colors.dart';
import 'custom_list_tile.dart';
import 'prayer_time_service.dart';



class PrayerTimesPage extends StatefulWidget {
  const PrayerTimesPage({super.key});

  @override
  State<PrayerTimesPage> createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  final prayerTimesService = PrayerTimesService();

  @override
  void initState() {
    super.initState();
    loadPrayerTimes();
  }

  Future<void> loadPrayerTimes() async {
    await prayerTimesService.fetchPrayerTimes();
    setState(() {}); // Trigger a rebuild after fetching prayer times
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor2,
      appBar: AppBar(
        title: const Text('Prayer Times'),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            CustomListTile(
              title: 'Fajr',
              tileColor: primaryColor,
              trailing: DateFormat('hh:mm a').format(prayerTimesService.fajar),
            ),
            const SizedBox(height: 30),
            CustomListTile(
              title: 'Sunrise',
              tileColor: primaryColor,
              trailing:
              DateFormat('hh:mm a').format(prayerTimesService.sunrise),
            ),
            const SizedBox(height: 30),
            CustomListTile(
              title: 'Dhuhr',
              tileColor: primaryColor,
              trailing:
              DateFormat('hh:mm a').format(prayerTimesService.dhuhr),
            ),
            const SizedBox(height: 30),
            CustomListTile(
              title: 'Asr',
              tileColor: primaryColor,
              trailing: DateFormat('hh:mm a').format(prayerTimesService.asar),
            ),
            const SizedBox(height: 30),
            CustomListTile(
              title: 'Maghrib',
              tileColor: primaryColor,
              trailing:
              DateFormat('hh:mm a').format(prayerTimesService.maghrib),
            ),
            const SizedBox(height: 30),
            CustomListTile(
              title: 'Isha',
              tileColor: primaryColor,
              trailing:
              DateFormat('hh:mm a').format(prayerTimesService.isha),
            ),
          ],
        ),
      ),
    );
  }
}