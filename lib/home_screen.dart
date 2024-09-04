import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'assets/images/quiz-logo.png',
        color: const Color.fromARGB(150, 255, 255, 255),
      ),
      const SizedBox(height: 30),
      Text('Learn Flutter the fun way!',
          style: GoogleFonts.lato(color: Colors.white, fontSize: 24)),
      const SizedBox(height: 40),
      OutlinedButton.icon(
          onPressed: switchScreen,
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 14)),
          icon: const Icon(Icons.arrow_right_alt),
          label: Text(
            'Start Quiz',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
          ))
    ]));
  }
}
