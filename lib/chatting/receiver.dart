class MessageDate {
  final String content;
  final String createdDate;

  MessageDate({required this.content, required this.createdDate});

  @override
  String toString() {
    return 'MessageDate{content: $content, createdDate: $createdDate}';
  }
}