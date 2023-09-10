import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:jtlc_front/src/features/home/domain/entity/visitor.dart';

class CardEntrantWidget extends StatelessWidget {
  final Visitor datax;
  const CardEntrantWidget({
    super.key,
    required this.datax,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.teal,
        ),
        title: Text('${datax.name}'),
        trailing: const Icon(FeatherIcons.user),
      ),
    );
  }
}
