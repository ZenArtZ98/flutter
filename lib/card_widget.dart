// // card_widget.dart
// import 'package:flutter/material.dart';
// import 'api_service.dart';
//
// class CardWidget extends StatefulWidget {
//   @override
//   _CardWidgetState createState() => _CardWidgetState();
// }
//
// class _CardWidgetState extends State<CardWidget> {
//   late Future<List<dynamic>> futureData;
//
//   @override
//   void initState() {
//     super.initState();
//     futureData = ApiService().fetchData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<dynamic>>(
//       future: futureData,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         snapshot.data![index]['setup'],
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         snapshot.data![index]['punchline'],
//                         style: TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Text("${snapshot.error}");
//         }
//
//         // By default, show a loading spinner.
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }