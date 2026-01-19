class ChatMessage {
  final String text; //final - declared a variable once
  final bool isUserMessage;
  final DateTime timestamp;

  ChatMessage ({
    required this.text,
    required this.isUserMessage,
    required this.timestamp,
});
}