import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int score;
  final void Function() onRestartQuiz;

  Result(this.score, this.onRestartQuiz);

  String get resultPhrase {

    switch (score) {
      case 0:
        return 'Deu ruim!'; 
      case 1:
        return 'Uma é melhor que nada!';
      case 2:
        return 'Duas está bom!';
      case 3:
      return 'Excelente! Acertou todas!';
        break;
      default:
    }
    // if(score == 0) {
    //   return 'Deu ruim!';
    // } else if (score < 3){
    //   return 'Você foi bem!';
    // } else {
    //   return 'Tu é o Jiraya da porra toda!';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(resultPhrase,
            style: TextStyle(
            fontSize: 28,
            ),
          ),
        ),
        FlatButton(
          onPressed: onRestartQuiz,
          child: Text('Reiniciar Quiz'),
          color: Colors.blue,
          textColor: Colors.white,
        ),
      ],
    );
  }
}