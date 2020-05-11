class QuestionItem {
  String text;
  bool isBlank;

  QuestionItem(this.text, this.isBlank);

  QuestionItem.fromJson(Map<String, dynamic> data)
      : text = data['text'],
        isBlank = data['isBlank'];
}
