class QuestionItem {
  final String text;
  final bool isBlank;

  QuestionItem(this.text, this.isBlank);

  QuestionItem.fromJson(Map<String, dynamic> data)
      : text = data['text'],
        isBlank = data['isBlank'];
}
