// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/common_config/app_theme_jtlc.dart';
import 'package:jtlc_front/src/common_utils/utils.dart';
import 'package:jtlc_front/src/common_widgets/text_heading7.dart';
import 'package:logger/logger.dart';

import '../../auth/presentation/login_myjapfa/login_screen.dart';

class NotificationScreen extends StatefulHookConsumerWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const routeName = 'notificationScreen';

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final usernameState = ref.watch(usernameProvider);
    Stream<QuerySnapshot> notifications = FirebaseFirestore.instance
        .collection('notifications')
        .doc(usernameState.toLowerCase())
        .collection('jpops')
        .snapshots();

    // Stream<QuerySnapshot> gejala = FirebaseFirestore.instance.collection('gejala').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: notifications,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          // return ListView.builder(
          //   itemCount: snapshot.data!.docs.length,
          //   itemBuilder: (context, index) {
          //     DocumentSnapshot document = snapshot.data!.docs[index];
          //     Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          //     return CheckboxListTile(
          //       title: Text(data['nama']),
          //       value: data['value'],
          //       onChanged: (bool? value) {
          //         FirebaseFirestore.instance.collection('gejala').doc(document.id).update(
          //           {'value': value!},
          //         );
          //       },
          //       // secondary: const Icon(Icons.hourglass_empty),
          //     );
          //   },
          // );
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              // DateTime dt = (data['time'] as Timestamp).toDate();
              Timestamp t = data['time'];
              DateTime d = t != null ? t.toDate() : DateTime.now();
              Logger().i(t);
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(data['activity']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['desc'] ?? '-'),
                        Text(simpleDateTimeFormat(d.toString())),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            TextHeading7(
                              title: 'Baca',
                              color: AppThemeJtlc.jtlcBlueDark,
                              fontStyle: FontStyle.italic,
                            ),
                          ],
                        )
                      ],
                    ),
                    // trailing: Text(simpleDateTimestampFormat(data['time'].toString())),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
