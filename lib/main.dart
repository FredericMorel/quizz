import 'package:flutter/material.dart';
import 'quizBrian.dart';

QuizBrain qb = QuizBrain();

void main() {
  runApp(const QuizzApp());
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  _QuizzAppState createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  List<Icon> suiviScore = [];

  checkAnswer(bool x) {
    bool bonnereponse = qb.getQuestionReponse();
    setState(() {
      //if (suiviScore.length != qb.)
      if (bonnereponse == x) {
        suiviScore.add(Icon(Icons.close, color: Colors.red));
      } else {
        suiviScore.add(Icon(Icons.check, color: Colors.green));
      }

      qb.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /* Texte principal */

                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Center(
                      child: Text(
                        qb.getQuestionEnonce(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                  ),
                ),

                /* --------------- Bouton vrai ---------------------*/
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green)),
                      onPressed: () {
                        checkAnswer(true);
                      },
                      child: Text(
                        "Vrai",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),

                /* ----------------------  Bouton Faux --------------------------*/
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                      onPressed: () {
                        checkAnswer(false);
                      },
                      child: Text(
                        "Faux",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: suiviScore,
                )
              ]),
        ),
      ),
    );
  }
}
