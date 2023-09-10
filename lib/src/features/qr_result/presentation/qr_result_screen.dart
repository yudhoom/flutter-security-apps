// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:jtlc_front/src/common_widgets/text_heading3.dart';
// import 'package:jtlc_front/src/features/qr_scan/domain/model/qr_event.dart';
// import 'package:jtlc_front/src/features/qr_scan/presentation/scan_qr_screen.dart';

// import '../../auth/presentation/login_screen.dart';

// class QrResultScreen extends ConsumerWidget {
//   const QrResultScreen({Key? key}) : super(key: key);
//   static const routeName = 'qrResultScreen';

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final appGradient = ref.watch(appGradationProvider);
//     final qrResult = ref.watch(qrEventResult);

//     final results = [
//       {"key": "NIK", "value": qrResult.empid},
//       {"key": "Nama", "value": qrResult.name},
//       {
//         "key": "Gender",
//         "value": qrResult.gendercode.toString() == "1" ? "Pria" : "Wanita",
//       },
//       {"key": "Event Name", "value": qrResult.eventName},
//       {"key": "Event Description", "value": qrResult.eventDesc},
//     ];

//     return WillPopScope(
//       onWillPop: () async {
//         ref.watch(barcodeProvider.state).state = '';
//         context.pop();
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('QR Result'),
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: appGradient,
//             ),
//           ),
//         ),
//         body: ListView(
//           padding: EdgeInsets.symmetric(horizontal: 0.sp),
//           children: [
//             Card(
//               elevation: 3,
//               child: ListTile(
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     FittedBox(
//                       child: TextHeading3(title: 'ID User:'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               child: InkWell(
//                 onTap: () {
//                   _onOpenContent(context, qrResult.imageUrl ?? '');
//                 },
//                 child: CircleAvatar(
//                   backgroundImage: NetworkImage(
//                     qrResult.imageUrl ?? '',
//                   ),
//                   radius: 120,
//                 ),
//               ),
//             ),
//             Card(
//               elevation: 3,
//               child: ListTile(
//                 title: DataTable(
//                   columns: const [
//                     DataColumn(label: Text('Info')),
//                     DataColumn(label: Text('Description')),
//                   ],
//                   rows: results.map((result) {
//                     return DataRow(
//                       cells: [
//                         DataCell(Text(result['key'].toString())),
//                         DataCell(Text(result['value'].toString())),
//                       ],
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10.sp),
//               child: ElevatedButton(
//                 onPressed: () {
//                   ref.watch(barcodeProvider.state).state = '';
//                   context.goNamed(ScanQRScreen.routeName);
//                 },
//                 child: const Text('Scan Kembali'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onOpenContent(BuildContext context, String s) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: Image.network(s),
//       ),
//     );
//   }

//   void _showError(BuildContext context, QrEvent? value) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Error'),
//         content: Text(value.toString()),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }
