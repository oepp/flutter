import 'package:oepp/models/question.dart';

class Game {
  List<Question> questions;

  Game(this.questions);

  Game.fromJson(Map<String, dynamic> data)
      : questions = _questionsFromJson(data);

  static List<Question> _questionsFromJson(Map<String, dynamic> data)
  {
    List<Question> list = new List<Question>();
    for (var json in data['questions']){
      var question = Question.fromJson(json);
      list.add(question);
    }

    return list;
  }
}