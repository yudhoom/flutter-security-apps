// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:jtlc_front/src/features/qr_result/presentation/qr_result_screen.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class ResultsScreen extends StatelessWidget {
//   const ResultsScreen({Key? key}) : super(key: key);
//   static const String routeName = 'resultsScreen';

//   @override
//   Widget build(BuildContext context) {
//     var listData = [
//       {
//         'nik': '123456789',
//         'name': 'Ageng Rahadian',
//         'address': 'Jl. Raya',
//         'phone': '081234567890',
//         'image': 'assets/images/avatar/avatar1.png'
//       },
//       {
//         'nik': '123456789',
//         'name': 'Hendra Kurniawan',
//         'address': 'Jl. Raya',
//         'phone': '081234567890',
//         'image': 'assets/images/avatar/avatar2.png'
//       },
//       {
//         'nik': '123456789',
//         'name': 'Dharma Sadha',
//         'address': 'Jl. Raya',
//         'phone': '081234567890',
//         'image': 'assets/images/avatar/avatar3.png'
//       },
//       {
//         'nik': '123456789',
//         'name': 'Franciscus Reza Paul Adam',
//         'address': 'Jl. Raya',
//         'phone': '081234567890',
//         'image': 'assets/images/avatar/avatar4.png'
//       },
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Results'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10.0.sp),
//           Expanded(
//             flex: 1,
//             child: ListView.builder(
//               itemCount: listData.length,
//               itemBuilder: ((context, index) {
//                 var data = listData[index];
//                 return InkWell(
//                   onTap: () => context.pushNamed(QrResultScreen.routeName),
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10.sp),
//                     child: Card(
//                       child: ListTile(
//                         leading: Image.asset('${data['image']}'),
//                         title: Text('${data['nik']}: ${data['name']}'),
//                         subtitle: Text('Scanned at ${DateTime.now()}'),
//                         trailing: QrImage(
//                           data: "1234567890",
//                           version: QrVersions.auto,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
