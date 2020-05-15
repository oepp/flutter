import 'package:oepp/models/question_item.dart';
import 'package:oepp/models/question_line.dart';

class Question {
  final String description;
  final List<QuestionLine> lines;

  Question(this.description, this.lines);

  Question.fromJson(Map<String, dynamic> data)
      : description = data['description'],
        lines = _linesFromJson(data);

  static List<QuestionLine> _linesFromJson(Map<String, dynamic> data) {
    List<QuestionLine> list = new List<QuestionLine>();
    for (var json in data['lines']) {
      var line = QuestionLine.fromJson(json);
      list.add(line);
    }

    return list;
  }

  List<QuestionItem> getBlankItems() {
    List<QuestionItem> blankItems = List<QuestionItem>();

    for (var line in lines) {
      for (var item in line.items) {
        if (item.isBlank) {
          blankItems.add(item);
        }
      }
    }

    return blankItems;
  }

  bool isContainsItem(QuestionItem questionItem){
    for (var line in lines) {
      for (var item in line.items){
        if (item.text == questionItem.text){
          return true;
        }
      }
    }

    return false;
  }

  void removeItem(QuestionItem questionItem) {
    for (var line in lines) {
      for (var item in line.items){
        if (item.text == questionItem.text){
          line.items.remove(questionItem);
        }
      }
    }
  }
}
