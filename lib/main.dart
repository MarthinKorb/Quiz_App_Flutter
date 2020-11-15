import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
    var selectedQuestion = 0;

    var _totalScored = 0;

    final _questions = const [
     {
       'text': "De quem é a famosa frase “Penso, logo existo”?",
       'answer': [
         {'text': 'Platão', 'score': 0},
         {'text': 'Galileu Galilei', 'score': 0},
         {'text': 'Descartes', 'score': 1},
         {'text': 'Sócrates', 'score': 0},
      ]
     },
     {
       'text': 'De onde é a invenção do chuveiro elétrico?',
       'answer': [
         {'text': 'França', 'score': 0},
         {'text': 'Inglaterra', 'score': 0},
         {'text': 'Brasil', 'score': 1},
         {'text': 'Austrália', 'score': 0},
       ],
     },
     {
       'text': 'Quanto tempo a luz do Sol demora para chegar à Terra?',
       'answer': [
         {'text': '12 minutos', 'score': 0},
         {'text': '1 dia', 'score': 0},
         {'text': '12 horas', 'score': 0},
         {'text': '8 minutos', 'score': 1},
         {'text': '32 segundos', 'score': 0},
       ]
     }
    ];

    bool get isThereSelectedQuestion {
      return selectedQuestion < _questions.length;
    }

  void _answer(int scored) {
   if(isThereSelectedQuestion){
      setState(() {
      selectedQuestion++;
      _totalScored += scored;
    });
    print(_totalScored);
   }
  }

  void _restarQuiz () {
    setState(() {
      selectedQuestion = 0;
      _totalScored = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: isThereSelectedQuestion ? 
        Quiz(questions: _questions,selectedQuestion: selectedQuestion, onAnswer: _answer) 
        : Result(_totalScored, _restarQuiz),
      ),
    );
  }
}