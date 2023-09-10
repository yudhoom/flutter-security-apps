import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../auth/presentation/login_myjapfa/login_screen.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const routeName = 'chatScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameState = ref.watch(usernameProvider);
    // Stream<QuerySnapshot> rooms =
    //     FirebaseFirestore.instance.collection('rooms').doc(usernameState.toLowerCase()).collection('jpops').snapshots();

    Stream<QuerySnapshot> myRooms =
        FirebaseFirestore.instance.collection('rooms').where(('members'), arrayContainsAny: [usernameState]).snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat $usernameState'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: myRooms,
        // stream: imMembers,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              bool isOwner = data['owner'].contains(usernameState);
              return Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: (index == 0 ? 10.0 : 1.0), bottom: 0.0),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(isOwner ? data['photoUrl'] : data['owner_photo'] ?? 'https://picsum.photos/200'),
                    ),
                    title: Text(data['title'] ?? 'No Title'),
                    onTap: () {
                      //
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
