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
  /* List<String> questions = [
    "Le piton des neiges est un volcan de la Réunion",
    "Flutter permet de faire des applications web également",
    "PHP est le langage utilisé par flutter",
    "The end"
  ];
  List<bool> reponses = [true, true, false]; */

  int questionNumber = 0;
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
                        qb.questions[questionNumber].enonce,
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
                        bool bonnereponse = qb.questions[questionNumber].reponse;
                        setState(() {
                          if (bonnereponse == false) {
                            suiviScore
                                .add(Icon(Icons.close, color: Colors.red));
                          } else {
                            suiviScore
                                .add(Icon(Icons.check, color: Colors.green));
                          }

                          questionNumber++;
                        });
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
                        bool bonnereponse = qb.questions[questionNumber].reponse;
                        setState(() {
                          if (bonnereponse == true) {
                            suiviScore
                                .add(Icon(Icons.close, color: Colors.red));
                          } else {
                            suiviScore
                                .add(Icon(Icons.check, color: Colors.green));
                          }

                          questionNumber++;
                        });
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
