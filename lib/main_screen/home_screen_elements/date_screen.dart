import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_light_al_noor/global/colors.dart'; // Import the intl package for date formatting

class TodayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get current date
    DateTime now = DateTime.now();

    // Format date to display both day and date
    String formattedDate = DateFormat('EEEE, d MMMM yyyy').format(now);

    return Container(

      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12), // Rounded border
      ),
      padding: EdgeInsets.all(16), // Add padding for spacing
      child: Text(
        formattedDate, // Display formatted date
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), // Adjust text style
      ),
    );
  }
}
