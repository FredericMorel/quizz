import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain qb = QuizBrain();

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(child: QuizzApp()),
      ),
    ),
  );
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  _QuizzAppState createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  List<Icon> suiviScore = [];
  int score = 0;

  checkAnswer(bool x) {
    bool bonnereponse = qb.getQuestionReponse();
    setState(() {
      //if (suiviScore.length != qb.)
      if (bonnereponse == x) {
        score++;
        suiviScore.add(Icon(Icons.close, color: Colors.green));
      } else {
        suiviScore.add(Icon(Icons.check, color: Colors.red));
      }
      qb.nextQuestion(); // questionNumber = question number + 1
    });
    if (suiviScore.length == qb.nbQuestion()) {
      
      Alert(
              context: context,
              title: "Fin du quiz",
              desc: "Vous avez eu $score bonnes réponses.")
          .show();
      score = 0;
      qb.reset();
      suiviScore = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ]);
  }
}
