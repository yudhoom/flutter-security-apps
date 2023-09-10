import 'package:flutter/material.dart';

import 'app_theme_jtlc.dart';
import 'jtlc_palette.dart';

class JtlcScaffold extends StatelessWidget {
  final Scaffold content;
  const JtlcScaffold({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JTLC',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: JtlcPalette.jtlcPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          foregroundColor: AppThemeJtlc.jtlcHeadingBlack,
          color: AppThemeJtlc.jtlcGray,
          elevation: 0.0,
        ),
      ),
      home: SafeArea(
        top: false,
        child: content,
      ),
    );
  }
}
