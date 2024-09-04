import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.text, this.onTap, {super.key});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(6),
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
              backgroundColor: const Color.fromRGBO(12, 117, 202, 1),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(fontSize: 18),
            )));
  }
}
