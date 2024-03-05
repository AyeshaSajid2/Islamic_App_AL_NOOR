// import 'package:flutter/material.dart';
// import 'package:hijri_picker/hijri_picker.dart';
//
// class HijriMonthPicker extends StatelessWidget {
//   final HijriCalendar selectedDate;
//   final ValueChanged<HijriCalendar>? onChanged;
//   final HijriCalendar firstDate;
//   final HijriCalendar lastDate;
//   final SelectableDayPredicate? selectableDayPredicate;
//
//   HijriMonthPicker({
//     Key? key,
//     required this.selectedDate,
//     required this.firstDate,
//     required this.lastDate,
//     this.onChanged,
//     this.selectableDayPredicate,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300.0,
//       child: HijriMonthPicker(
//         onChanged: onChanged,
//         hijriCalendar: selectedDate,
//         firstDate: firstDate,
//         lastDate: lastDate,
//         selectableDayPredicate: selectableDayPredicate, selectedDate: null,
//       ),
//     );
//   }
// }
