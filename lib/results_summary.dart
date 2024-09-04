import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsSummary extends StatelessWidget {
  ResultsSummary(this.summary, {super.key});

  List<Map<String, Object>> summary;

  Color chooseColor(data) {
    if (data['userAnswer'] == data['correctAnswer']) {
      return const Color.fromRGBO(198, 237, 177, 1);
    }
    return const Color.fromARGB(255, 245, 184, 180);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: summary.map((data) {
              return Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                          height: 30,
                          width: 20,
                          decoration: BoxDecoration(
                            color: chooseColor(data),
                            shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              ((data['index'] as int) + 1).toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['question'].toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text(data['userAnswer'].toString(),
                                style: TextStyle(color: chooseColor(data))),
                            Text(data['correctAnswer'].toString(),
                                style: const TextStyle(
                                    color: Color.fromRGBO(198, 237, 177, 1))),
                          ],
                        ))
                  ],
                ),
              );
            }).toList(),
          ),
        ));
  }
}
