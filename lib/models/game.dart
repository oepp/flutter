import 'package:oepp/models/question.dart';

class Game {
  List<Question> _questions;
  int _currentQuestionIndex = 0;

  Game.fromJson(Map<String, dynamic> data)
      : _questions = _questionsFromJson(data);

  static List<Question> _questionsFromJson(Map<String, dynamic> data)
  {
    List<Question> list = new List<Question>();
    for (var json in data['questions']){
      var question = Question.fromJson(json);
      list.add(question);
    }

    return list;
  }

  Question getCurrentQuestion() => _questions[_currentQuestionIndex];

  int getCurrentQuestionNumber() => _currentQuestionIndex + 1;

  int getTotalQuestions() => _questions.length;

  String getStatus() => "Question: ${getCurrentQuestionNumber()} / ${getTotalQuestions()}";

  bool isOver() => _currentQuestionIndex == _questions.length - 1;

  void nextQuestion(){
    _currentQuestionIndex++;
  }
}