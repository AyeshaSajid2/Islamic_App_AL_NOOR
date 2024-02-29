import 'package:flutter/material.dart';
import 'package:the_light_al_noor/features/PrayerTimings/prayer_timings.dart';
import '../../features/PrayerTimings/prayer_time_service.dart';
import '../../global/colors.dart';
// Import the prayertimePage

class RemainingActivity extends StatefulWidget {
  const RemainingActivity({super.key});

  @override
  State<RemainingActivity> createState() => _RemainingActivityState();
}

class _RemainingActivityState extends State<RemainingActivity> {
  late DateTime nextPrayerTime = DateTime.now(); // Initialize with current time
  late String nextPrayerName = "Upcoming activity";

  @override
  void initState() {
    super.initState();
    // Fetch the prayer times and calculate the next prayer time
    getNextPrayerTime().then((value) {
      nextPrayerTime = value;
      nextPrayerName = getPrayerName(nextPrayerTime);
      setState(() {}); // Update the UI after getting the next prayer time
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the remaining time until the next prayer
    Duration remainingTime = nextPrayerTime.difference(DateTime.now());
    String remainingTimeString = '${remainingTime.inHours}h ${remainingTime.inMinutes.remainder(60)}min';

    return GestureDetector(
      onTap: () {
        // Navigate to the prayertimePage when the arrow is clicked
        Navigator.push(context, MaterialPageRoute(builder: (context) => const PrayerTimesPage()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
            topLeft: Radius.zero,
            topRight: Radius.zero,
          ),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$nextPrayerName',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Remaining Activity",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    remainingTimeString,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                // Navigate to the prayertimePage when the arrow is clicked
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PrayerTimesPage()));
              },
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

final prayerTimesService = PrayerTimesService();

Future<DateTime> getNextPrayerTime() async {
  await prayerTimesService.fetchPrayerTimes();

  DateTime now = DateTime.now();
  List<DateTime> prayerTimes = [
    prayerTimesService.fajar,
    prayerTimesService.sunrise,
    prayerTimesService.dhuhr,
    prayerTimesService.asar,
    prayerTimesService.maghrib,
    prayerTimesService.isha
  ];
  prayerTimes.sort((a, b) => a.compareTo(b));

  for (DateTime prayerTime in prayerTimes) {
    if (prayerTime.isAfter(now)) {
      return prayerTime;
    }
  }

  // If all prayer times are in the past, return the first prayer time of the next day
  return prayerTimes.first.add(const Duration(days: 1));
}

String getPrayerName(DateTime time) {
  if (time == prayerTimesService.fajar) {
    return 'Fajr';
  } else if (time == prayerTimesService.sunrise) {
    return 'Sunrise';
  } else if (time == prayerTimesService.dhuhr) {
    return 'Dhuhr';
  } else if (time == prayerTimesService.asar) {
    return 'Asar';
  } else if (time == prayerTimesService.maghrib) {
    return 'Maghrib';
  } else if (time == prayerTimesService.isha) {
    return 'Isha';
  }
  return '';
}
