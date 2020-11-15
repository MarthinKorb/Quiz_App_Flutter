import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {

   final List<Map<String, Object>> questions;
    final int selectedQuestion;
    final void Function(int) onAnswer;

    bool get isThereSelectedQuestion {
      return selectedQuestion < questions.length;
    }

    Quiz({
      @required this.questions,
      @required this.selectedQuestion,
      @required this.onAnswer,
    });

  @override
  Widget build(BuildContext context) {

     List<Map<String, Object>> answersList = isThereSelectedQuestion ? questions[selectedQuestion]['answer'] : null;

    return Column(
          children: [
            Question(questions[selectedQuestion]['text']),           
             ...answersList.map((resp) {
               return  Answer(resp['text'], () => onAnswer(resp['score']));
             }).toList(),                
          ],
        );
  }
}