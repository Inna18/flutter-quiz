import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.selectedAnswers, this.toMain, {super.key});
  final List<String> selectedAnswers;
  List<Map<String, Object>> answersSummary = [];
  void Function() toMain;

  List<Map<String, Object>> getSummaryData() {
    answersSummary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      var answerObj = {
        'index': i,
        'question': questions[i].text,
        'correctAnswer': questions[i].answers[0],
        'userAnswer': selectedAnswers[i]
      };
      answersSummary.add(answerObj);
    }
    return answersSummary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalNum = questions.length;
    final correctNum = summaryData.where(
      (element) {
        return element['userAnswer'] == element['correctAnswer'];
      },
    ).length;

    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $correctNum out of $totalNum questions correctly!',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                fontSize: 22,
                color: const Color.fromRGBO(12, 117, 202, 1),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          ResultsSummary(getSummaryData()),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.rotateRight,
                color: Colors.white,
              ),
              TextButton(
                  onPressed: toMain,
                  child: const Text(
                    'Restart Quiz',
                    style: TextStyle(color: Color.fromRGBO(12, 117, 202, 1)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
