import 'package:flutter/material.dart';
import 'question_bank.dart';
import 'alert_dialog.dart';


Question_Bank bank = Question_Bank();
Alert_Dialog dialogBox = Alert_Dialog();

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
          backgroundColor: const Color(0xFFDAD7D0),
          body: const Quizz(),
          appBar: AppBar(
            backgroundColor: const Color(0xFF845E4D),
            title: const Center(
              child: Text('DART PRACTICE QUIZ-APP',style: TextStyle(fontFamily: 'PermanentMarker',fontSize: 25),),
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


  int score = 0;

  void buttonPressed(bool val){
    bool correctAnswer = bank.answer();
    if (correctAnswer == val) {
      bank.scoreIcons.add(
        const Icon(
          Icons.done,
          color: Colors.green,
          size: 35,
        ),
      );
      score++;
    } else {
      bank.scoreIcons.add(const Icon(
        Icons.close,
        color: Colors.red,
        size: 35,

      ));
    }
    setState(() {
      bank.nextQuestion();
    });


    if(bank.questionStatus()){
      dialogBox.alertDialogBox(context,score);
      setState(() {
        score = 0;
        bank.reset();
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(child: Text(bank.question(),textAlign:TextAlign.justify,style: const TextStyle(fontSize: 35,),)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green)),
              onPressed: () {
                buttonPressed(true);
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
                buttonPressed(false);
                // if(bank.questionStatus()){
                //   bank.onAlert(context);
                // }
                },
              child: const Text(
                'FALSE',
                style: TextStyle(fontSize: 25),
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: bank.scoreIcons,
        )
      ],
    );
  }
}
