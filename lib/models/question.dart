import 'package:oepp/models/question_line.dart';

class Question {
  final String description;
  final List<QuestionLine> lines;

  Question(this.description, this.lines);

  Question.fromJson(Map<String, dynamic> data)
      : description = data['description'],
        lines = data['lines'].map((i) => QuestionLine.fromJson(i)).toList();
}
