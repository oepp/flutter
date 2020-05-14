import 'package:oepp/models/question.dart';

class Game {
  List<Question> questions;

  Game(this.questions);

  Game.fromJson(Map<String, dynamic> data)
      : questions = data['questions'].map((i) => Question.fromJson(i)).toList();
}