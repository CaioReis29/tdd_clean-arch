import 'package:flutter/material.dart';

void main() {
  runApp(const AstronomyPictures());
}

class AstronomyPictures extends StatelessWidget {
  const AstronomyPictures({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astronomy Pictures',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: null,
    );
  }
}
