import 'package:oepp/models/question_item.dart';

class QuestionLine {
  List<QuestionItem> items;

  QuestionLine(this.items);

  QuestionLine.fromJson(Map<String, dynamic> data)
      : items = data['items'].map((i) => QuestionItem.fromJson(i)).toList();
}
