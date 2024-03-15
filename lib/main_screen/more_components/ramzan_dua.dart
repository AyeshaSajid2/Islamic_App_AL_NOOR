import 'package:flutter/material.dart';
import 'package:the_light_al_noor/global/colors.dart';

class AshraDuaWidget extends StatelessWidget {
  final String imagePath;
  final String duaText;
  final String duaTranslation;
  final String duaTranslationUrdu;

  const AshraDuaWidget({
    Key? key,
    required this.imagePath,
    required this.duaText,
    required this.duaTranslation,
    required this.duaTranslationUrdu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 2.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: Opacity(
              opacity: 0.45,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.black.withOpacity(0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  duaText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  duaTranslation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  duaTranslationUrdu,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            color: Colors.black.withOpacity(0.5),
            child: Text(
              'روزہ رکھنے کی نیت',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FirstAshraDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Ashra Duas'),
      ),
      body: ListView(
        children: [
          AshraDuaWidget(
            imagePath: 'assets/images/ramadan_images/dua_phla_ashray.jpg',
            duaText: 'وَبِصَوْمِ غَدٍ نَّوَيْتُ مِنْ شَهْرِ رَمَضَانََ',
            duaTranslationUrdu: '’اورمیں نے ماہ رمضان کے کل کے روزے کی نیت کی',
            duaTranslation: 'I Intend to keep the fast for month of Ramadan',
          ),
          AshraDuaWidget(
            imagePath: 'assets/images/ramadan_images/dua_phla_ashray.jpg',
            duaText: 'رَبِّ اغْفِرْ وَارْحَمْ وَأَنْتَ خَيْرُ الرَّاحِمِينَ',
            duaTranslation: 'Allah! Forgive me and have mercy on me. You are the Most Merciful of all',
            duaTranslationUrdu: 'اللہ! مجھے بخش دے اور مجھ پر رحم فرما۔ آپ سب سے زیادہ رحم کرنے والے ہیں۔',
          ),
          AshraDuaWidget(
            imagePath: 'assets/images/ramadan_images/dua_phla_ashray.jpg',
            duaText: 'رَبِّ اغْفِرْ وَارْحَمْ وَأَنْتَ خَيْرُ الرَّاحِمِينَ',
            duaTranslation: 'Allah! Forgive me and have mercy on me. You are the Most Merciful of all',
            duaTranslationUrdu: 'اللہ! مجھے بخش دے اور مجھ پر رحم فرما۔ آپ سب سے زیادہ رحم کرنے والے ہیں۔',
          ),
          AshraDuaWidget(
            imagePath: 'assets/images/ramadan_images/dua_phla_ashray.jpg',
            duaText: 'رَبِّ اغْفِرْ وَارْحَمْ وَأَنْتَ خَيْرُ الرَّاحِمِينَ',
            duaTranslation: 'Allah! Forgive me and have mercy on me. You are the Most Merciful of all',
            duaTranslationUrdu: 'اللہ! مجھے بخش دے اور مجھ پر رحم فرما۔ آپ سب سے زیادہ رحم کرنے والے ہیں۔',
          ),
          AshraDuaWidget(
            imagePath: 'assets/images/ramadan_images/dua_phla_ashray.jpg',
            duaText: 'رَبِّ اغْفِرْ وَارْحَمْ وَأَنْتَ خَيْرُ الرَّاحِمِينَ',
            duaTranslation: 'Allah! Forgive me and have mercy on me. You are the Most Merciful of all',
            duaTranslationUrdu: 'اللہ! مجھے بخش دے اور مجھ پر رحم فرما۔ آپ سب سے زیادہ رحم کرنے والے ہیں۔',
          ),
        ],
      ),
    );
  }
}
