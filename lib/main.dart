import 'package:flutter/material.dart';

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
          body: Quizz(),
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

class Quizz extends StatelessWidget {
  const Quizz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.blueGrey,
            child: Center(child: Text('QUESTIONS')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.green)),
              onPressed: () {
                print('click');
              },
              child: const Text('TRUE',style: TextStyle(fontSize: 25),)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(Colors.red) ),
              onPressed: (){print('false pressed');},
              child: const Text('FALSE',style: TextStyle(fontSize: 25),)),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.done,
              color: Colors.green,
            ),
            Icon(Icons.close,color: Colors.red,),
            Icon(Icons.close,color: Colors.red,),
          ],
        )
      ],
    );
  }
}
