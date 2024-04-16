import 'package:flutter/material.dart';
import 'package:tdd_clean_arch/container_injections.dart';
import 'package:tdd_clean_arch/presentation/screens/today_apod/apod_today_screen.dart';

void main() async {
  await setUpContainer();
  runApp(const AstronomyPictures());
}

class AstronomyPictures extends StatelessWidget {
  const AstronomyPictures({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astronomy Pictures',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ApodTodayScreen(),
    );
  }
}
