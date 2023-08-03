import 'package:flutter/material.dart';
import 'question_structure.dart';

void main() {
  runApp(const Display());
}

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: const Quizz(),
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: const Center(
              child: Text('QUIZZ-APP'),
            ),
          ),
        ),
      ),
    );
  }
}

class Quizz extends StatefulWidget {
  const Quizz({Key? key}) : super(key: key);

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  List<Icon> scoreIcons = [];
  int questionNumber = 0;
  List<Question_Structure> questions = [
    Question_Structure('QAuestion number one', false),
    Question_Structure('QAuestion number two', true),
    Question_Structure('QAuestion number three', false)
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.blueGrey,
            child: Center(child: Text(questions[questionNumber].question)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green)),
              onPressed: () {
                bool correctAnswer = questions[questionNumber].answer;
                if (correctAnswer == true) {
                  scoreIcons.add(
                    Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                  );
                } else {
                  scoreIcons.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                setState(() {
                  if (questionNumber < questions.length - 1) {
                    questionNumber += 1;
                  }
                });
              },
              child: const Text(
                'TRUE',
                style: TextStyle(fontSize: 25),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)),
              onPressed: () {
                bool correctAnswer = questions[questionNumber].answer;
                if (correctAnswer == false) {
                  scoreIcons.add(
                    Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                  );
                } else {
                  scoreIcons.add(Icon(
                    Icons.close,
                    color: Colors.red,));
                }
                setState(() {
                  if (questionNumber < questions.length - 1) {
                    questionNumber += 1;
                  }
                });
              },
              child: const Text(
                'FALSE',
                style: TextStyle(fontSize: 25),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: scoreIcons,
        )
      ],
    );
  }
}
