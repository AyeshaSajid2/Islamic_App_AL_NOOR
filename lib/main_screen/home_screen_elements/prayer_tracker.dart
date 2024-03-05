// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class PrayerTracker extends StatefulWidget {
//   const PrayerTracker({Key? key}) : super(key: key);
//
//   @override
//   State<PrayerTracker> createState() => _PrayerTrackerState();
// }
//
// class _PrayerTrackerState extends State<PrayerTracker> {
//   int _selectedCheckBoxCount = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       // width: 300,
//       child: Container(
//         // padding: const EdgeInsets.all(5.0),
//         decoration: BoxDecoration(
//           color: Colors.blueGrey, // Use your color here
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min, // Adjust the mainAxisSize
//           children: [
//             const Text(
//               'Salah Tracker',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 14),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 // mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   _buildImageWithCheckbox('assets/images/praying_time/svg/morning.svg', 'Fajar', context),
//                   _buildImageWithCheckbox('assets/images/praying_time/svg/noon.svg', 'Duhr', context),
//                   _buildImageWithCheckbox('assets/images/praying_time/svg/afternoon.svg', 'Asr', context),
//                   _buildImageWithCheckbox('assets/images/praying_time/svg/evening.svg', 'Maghrib', context),
//                   _buildImageWithCheckbox('assets/images/praying_time/svg/night.svg', 'Isha', context),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 8),
//             Stack(
//               children: [
//                 LinearProgressIndicator(
//                   value: (_selectedCheckBoxCount / 5),
//                   backgroundColor: Colors.grey[300],
//                   valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue), // Use your color here
//                 ),
//               ],
//             ),
//             const SizedBox(height: 2), // Adjusted SizedBox height
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildImageWithCheckbox(String imagePath, String prayerTime, BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           if (_selectedCheckBoxCount < 5) {
//             _selectedCheckBoxCount++;
//           }
//         });
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ٱلْحَمْدُ لِلَّٰهِ'),));
//       },
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           SvgPicture.asset(
//             imagePath,
//             height: 90, width: 90,
//           ),
//           Positioned(
//             bottom: 5, // Adjust the position as needed
//             child: Text(
//               prayerTime,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 10,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class PrayerTracker extends StatefulWidget {
  const PrayerTracker({Key? key}) : super(key: key);

  @override
  _PrayerTrackerState createState() => _PrayerTrackerState();
}

class _PrayerTrackerState extends State<PrayerTracker> {
  List<bool> isChecked = [false, false, false, false, false];
  double progress = 0.0;

  void _showSnackbar(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Checkbox ${index + 1} clicked'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _updateProgress() {
    setState(() {
      int checkedCount = isChecked.where((element) => element).length;
      progress = checkedCount * 20.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text(
            'Salah Tracker',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              5,
                  (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    isChecked[index] = !isChecked[index];
                    _updateProgress();
                    if (_isCompleted()) {
                      _showCompletionDialog();
                    }
                  });
                },
                child: Checkbox(
                  value: isChecked[index],
                  onChanged: (value) {
                    setState(() {
                      isChecked[index] = value!;
                      _updateProgress();
                      if (_isCompleted()) {
                        _showCompletionDialog();
                      }
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          LinearProgressIndicator(
            value: progress / 100,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ],
      ),
    );
  }

  bool _isCompleted() {
    return isChecked.every((element) => element);
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You have completed all prayers.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
