import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jtlc_front/src/core/domain/entities/counter.dart';

class NotificationService {
  static final CollectionReference _notifCollection = FirebaseFirestore.instance.collection('dashboard_security');
  static Stream<Counter> getCounterStream() {
    return _notifCollection.doc('counter').snapshots().map(
      (querySnapshot) {
        return Counter.fromJson(querySnapshot.data() as Map<String, dynamic>);
      },
    );
  }
}

final dashboardStreamProvider = StreamProvider.autoDispose<Counter>(
  (ref) {
    return NotificationService.getCounterStream();
  },
);
