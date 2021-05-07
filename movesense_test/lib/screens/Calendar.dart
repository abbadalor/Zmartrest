// import 'package:flutter/material.dart';
// import 'package:movesense_test/lib/components/AppModel.dart';
// import 'package:provider/provider.dart';
// // import "package:googleapis_auth/auth_io.dart";
// // import 'package:googleapis/calendar/v3.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'NavDrawer.dart';
// // https://www.youtube.com/watch?v=AR-9ArLSiNY

// class Calendar extends StatefulWidget {
//   @override
//   _CalendarState createState() => _CalendarState();
// }

// class _CalendarState extends State<Calendar> {
//   CalendarController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CalendarController();
//   }

//   AppModel model;
//   Color mainColor = Color(0xff195670);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       drawer: NavDrawer(),
//       body: 
//       Consumer<AppModel>(
//         builder: (context, model, child) {
//           return Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Calendar"
//               ),
//               TableCalendar(calendarController: _controller),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
