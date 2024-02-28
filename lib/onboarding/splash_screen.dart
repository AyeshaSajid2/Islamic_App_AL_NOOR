import 'dart:math';

import 'package:flutter/material.dart';
import 'package:the_light_al_noor/global/colors.dart';
// import 'package:sellersapp/authentication/auth_screen.dart';

class MySplashScreen extends StatelessWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/splah/alnoor.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 50,
            right: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'The Light',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Jameel',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Al NOOR',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Jameel',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(225, 255, 182, 23),
                  ),
                ),
                const SizedBox(height: 15),
                IconButton.outlined(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => Container()),
                    );
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                  style: ButtonStyle(iconSize: MaterialStatePropertyAll(40.0),iconColor: MaterialStatePropertyAll(primaryColor2),),
                ),
              ],
            ),
          ),
          // Sprinkle stars
          Positioned.fill(
            child: CustomPaint(
              painter: StarsPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class StarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white;
    final Random random = Random();
    final double starSize = 2.0;
    final double spaceBetweenStars = 20.0;

    // Draw stars
    for (double i = 0; i < size.width; i += spaceBetweenStars) {
      for (double j = 0; j < size.height; j += spaceBetweenStars) {
        if (random.nextInt(10) == 0) {
          canvas.drawCircle(Offset(i, j), starSize, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
