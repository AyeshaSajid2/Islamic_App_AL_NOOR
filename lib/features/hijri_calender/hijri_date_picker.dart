// import 'package:flutter/material.dart';
// import 'package:hijri_picker/hijri_picker.dart';
//
// typedef SelectableDayPredicate = bool Function(HijriCalendar day);
//
// enum DatePickerMode {
//   day,
//   year,
// }
//
// class HijriCalendar {
//   int hYear = 1443;
//   int hMonth = 7;
//   int hDay = 1;
//
//   static HijriCalendar now() {
//     return HijriCalendar();
//   }
//
//   String toString() {
//     return "$hYear/$hMonth/$hDay";
//   }
// }
//
// class HijriDatePickerDialog extends StatelessWidget {
//   final HijriCalendar initialDate;
//   final HijriCalendar firstDate;
//   final HijriCalendar lastDate;
//   final SelectableDayPredicate? selectableDayPredicate;
//   final DatePickerMode initialDatePickerMode;
//
//   HijriDatePickerDialog({
//     Key? key,
//     required this.initialDate,
//     required this.firstDate,
//     required this.lastDate,
//     this.selectableDayPredicate,
//     this.initialDatePickerMode = DatePickerMode.day,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: HijriDatePicker(
//         initialDate: initialDate,
//         firstDate: firstDate,
//         lastDate: lastDate,
//         selectableDayPredicate: selectableDayPredicate,
//         initialDatePickerMode: initialDatePickerMode,
//       ),
//     );
//   }
// }
//
// class HijriDatePicker extends StatefulWidget {
//   final HijriCalendar initialDate;
//   final HijriCalendar firstDate;
//   final HijriCalendar lastDate;
//   final SelectableDayPredicate? selectableDayPredicate;
//   final DatePickerMode initialDatePickerMode;
//
//   HijriDatePicker({
//     Key? key,
//     required this.initialDate,
//     required this.firstDate,
//     required this.lastDate,
//     this.selectableDayPredicate,
//     this.initialDatePickerMode = DatePickerMode.day,
//   }) : super(key: key);
//
//   @override
//   _HijriDatePickerState createState() => _HijriDatePickerState();
// }
//
// class _HijriDatePickerState extends State<HijriDatePicker> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'Select Date',
//             style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20.0),
//           HijriMonthPicker(
//             selectedDate: widget.initialDate,
//             onChanged: (value) {},
//             firstDate: widget.firstDate,
//             lastDate: widget.lastDate,
//             selectableDayPredicate: widget.selectableDayPredicate,
//           ),
//           SizedBox(height: 20.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Do something with the selected date
//                 },
//                 child: Text('Ok'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
