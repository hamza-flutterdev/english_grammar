import 'package:google_generative_ai/google_generative_ai.dart';

class AiService {
  final GenerativeModel _gm = GenerativeModel(
    model: "gemini-2.0-flash",
    apiKey: "AIzaSyC6BcnlWO4hHGLL6gVGfrlrxZ4mVLrUEAw",
  );

  // Method to handle conversation messages
  Future<String> sendMessage(List<Map<String, String>> messages) async {
    try {
      // Convert messages to a single prompt
      String prompt = _convertMessagesToPrompt(messages);
      final content = [Content.text(prompt)];
      final response = await _gm.generateContent(content);
      return response.text ?? "No response generated";
    } catch (e) {
      return "Error generating content: ${e.toString()}";
    }
  }

  // Helper method to properly handle system context
  String _convertMessagesToPrompt(List<Map<String, String>> messages) {
    if (messages.isEmpty) return "";

    StringBuffer prompt = StringBuffer();

    // Handle system message first (if exists)
    var systemMessage = messages.firstWhere(
      (msg) => msg['role'] == 'system',
      orElse: () => <String, String>{},
    );

    if (systemMessage.isNotEmpty) {
      prompt.writeln('System Instructions: ${systemMessage['content']}');
      prompt.writeln('---');
    }

    // Process conversation history
    var conversationMessages =
        messages.where((msg) => msg['role'] != 'system').toList();

    if (conversationMessages.isEmpty) return prompt.toString().trim();

    // If there's only one conversation message, add it directly
    if (conversationMessages.length == 1) {
      prompt.writeln('User: ${conversationMessages.first['content'] ?? ""}');
      return prompt.toString().trim();
    }

    // Convert conversation history to formatted prompt
    for (var message in conversationMessages) {
      String role = message['role'] ?? 'user';
      String content = message['content'] ?? '';

      if (role == 'user') {
        prompt.writeln('User: $content');
      } else if (role == 'assistant') {
        prompt.writeln('Assistant: $content');
      }
    }

    return prompt.toString().trim();
  }
}
