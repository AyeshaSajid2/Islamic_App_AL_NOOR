import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_light_al_noor/main_screen/home_screen_elements/date_screen.dart';
import '../../features/PrayerTimings/prayer_time_service.dart';

class RamzanPage extends StatefulWidget {
  const RamzanPage({Key? key}) : super(key: key);

  @override
  _RamzanPageState createState() => _RamzanPageState();
}

class _RamzanPageState extends State<RamzanPage> {
  final prayerTimesService = PrayerTimesService();
  bool fajrNotification = false;
  bool maghribNotification = false;

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
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ramdan Special", style: TextStyle(fontSize: 22),),
            Text(
              'Sehar: ${DateFormat('hh:mm a').format(prayerTimesService.fajar)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Switch(
              value: fajrNotification,
              onChanged: (value) {
                setState(() {
                  fajrNotification = value;
                  // Add code to handle notification
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Aftar: ${DateFormat('hh:mm a').format(prayerTimesService.maghrib)}',
              style: TextStyle(fontSize: 18),
            ),
            Switch(
              value: maghribNotification,
              onChanged: (value) {
                setState(() {
                  maghribNotification = value;
                  // Add code to handle notification
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
