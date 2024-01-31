import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestionIndex = 0; // Índice da pergunta atual
  String? selectedAnswer;
  bool? isCorrect;
  final List<Map<String, dynamic>> questions = [
      {
        'question':
           'Qual destes animais é conhecido por ser o maior predador dos oceanos?',
        'answers': ['Leão do Mar', 'Polvo', 'Tubarão', 'Baleia'],
        'correctAnswer': 'Tubarão'

      },
      {
        'question':
           'Qual animal marinho é famoso por sua carapaça dura e longa vida?',
        'answers': [
          'Baleia Azul',
          'Caranguejo',
          'Tartaruga Marinha',
          'Estrela do Mar'
          ],
        'correctAnswer': 'Tartaruga Marinha'
      },

    // Adicione mais perguntas aqui
    ];
    void nextQuestion() {
      if (currentQuestionIndex < questions.length - 1){
        setState(() {
          currentQuestionIndex++;
        });
         }else {
          //Fim do Quiz, fazer algo aqui
         } 
      }
      void handleAnswer(String answer) {
        setState(() {
          selectedAnswer = answer;
          isCorrect = answer == questions[currentQuestionIndex]['correctAnswer'];
        });

        Future.delayed(Duration(seconds: 2), (){
          setState(() {
            //Resetar para o próximo estado da pergunta
            selectedAnswer = null;
            if (currentQuestionIndex < questions.length - 1) {
              currentQuestionIndex++;
            } else {
              //Fim do quiz
            }
            });
          });
      }
  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions [currentQuestionIndex];
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.deepPurple[50],
        title: Text('Quiz Marítimo!', style: GoogleFonts.roboto(fontWeight: FontWeight.bold))
        ),
        body: Column(
          children: [
            Container(
              color: Colors.deepPurple[50],
              width: double.infinity,
              height: 400,
              child: Center(
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text (currentQuestion ['question'],
                  style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18), ),
                ),
                ),
            ),
            Wrap(
              children: currentQuestion ['answers'].map<Widget>((resposta) {
             bool isSelected = selectedAnswer == resposta;
             Color? buttonColor;
             if(isSelected) {
              buttonColor = isCorrect! ? Colors.green : Colors.red;
             } 

              return meuBtn(
                resposta, () => handleAnswer (resposta), buttonColor);
              }).toList(),
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
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
            ),
            child: Text(resposta),
        ),
    );

