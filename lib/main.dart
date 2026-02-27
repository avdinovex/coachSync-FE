import 'package:flutter/material.dart';
import 'app/theme.dart';
import 'features/auth/presentation/pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoachSync',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      home: const StartPage(),
    );
  }
}
