import 'package:oepp/models/question_item.dart';

class QuestionLine {
  final List<QuestionItem> items;

  QuestionLine(this.items);

  QuestionLine.fromJson(Map<String, dynamic> data)
      : items = _itemsFromJson(data);

  static List<QuestionItem> _itemsFromJson(Map<String, dynamic> data)
  {
    List<QuestionItem> list = new List<QuestionItem>();
    for (var json in data['items']){
      var item = QuestionItem.fromJson(json);
      list.add(item);
    }

    return list;
  }
}
