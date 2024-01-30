import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestionIndex = 0; // Índice da pergunta atual
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Primeira Pergunta',
      'answers': ['Resposta 1', 'Resposta 2', 'Resposta 3', 'Resposta 4'],
    },
    // Adicione mais perguntas aqui
  ];
  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Fim do quiz, fazer algo aqui
    }
  }

  void handleAnswer() {
    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple[50],
          title: Text('Quiz marítimo!',
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold))),
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple[50],
            width: double.infinity,
            height: 400,
            child: Center(
              child: Text (currentQuestion ['Question'],
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18), ),
            )
          ),
          Wrap(
            children: currentQuestion ['answers']
            .map<Widget>((resposta) => meuBtn(resposta, handleAnswer))
            .toList(),
          ),
        ],
      ),
    );
  }
}

Widget meuBtn(String resposta, VoidCallback onPressed, Color? color) =>
 Container(
      margin: const EdgeInsets.all(16),
      width: 160,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(resposta),
      ),
    );
