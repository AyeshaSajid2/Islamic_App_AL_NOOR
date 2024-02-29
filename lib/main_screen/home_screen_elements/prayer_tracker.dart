import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrayerTracker extends StatefulWidget {
  const PrayerTracker({Key? key}) : super(key: key);

  @override
  State<PrayerTracker> createState() => _PrayerTrackerState();
}

class _PrayerTrackerState extends State<PrayerTracker> {
  int _selectedCheckBoxCount = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey, // Use your color here
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Adjust the mainAxisSize
          children: [
            const Text(
              'Prayer Tracker',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildImageWithCheckbox('assets/images/praying_time/svg/morning.svg', 'Fajar', context),
                  _buildImageWithCheckbox('assets/images/praying_time/svg/noon.svg', 'Duhr', context),
                  _buildImageWithCheckbox('assets/images/praying_time/svg/afternoon.svg', 'Asr', context),
                  _buildImageWithCheckbox('assets/images/praying_time/svg/evening.svg', 'Maghrib', context),
                  _buildImageWithCheckbox('assets/images/praying_time/svg/night.svg', 'Isha', context),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                LinearProgressIndicator(
                  value: (_selectedCheckBoxCount / 5),
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue), // Use your color here
                ),
              ],
            ),
            const SizedBox(height: 2), // Adjusted SizedBox height
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithCheckbox(String imagePath, String prayerTime, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedCheckBoxCount < 5) {
            _selectedCheckBoxCount++;
          }
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ٱلْحَمْدُ لِلَّٰهِ')));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            height: 80,
          ),
          Positioned(
            bottom: 5, // Adjust the position as needed
            child: Text(
              prayerTime,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
