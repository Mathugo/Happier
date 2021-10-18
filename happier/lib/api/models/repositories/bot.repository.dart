import 'package:dialog_flowtter/dialog_flowtter.dart';

import 'gpt3.dart';

class BotRepository {
  final DialogFlowtter _dialogInstance;
  final OpenAI openAI;
  BotRepository(this._dialogInstance, this.openAI) {
    // at first, we send hi to triggered the bot and respond at the next (avoid the bot to first speak)
    this.detectIntent("hi");
  }

  Future<String?> detectIntent(String query) async {
    String? responseMessage;
    try {
      DetectIntentResponse response = await _dialogInstance.detectIntent(
        queryInput: QueryInput(text: TextInput(text: query)),
      );
      responseMessage = response.text;
      // our bot didn't get that so we switch to gpt-3

      if (responseMessage == "none") {
        print("[*] Switching to gpt-3 ..");
        String answer = await this.openAI.answer(query, 100, [
          [
            "What is human life expectancy in the United States?",
            "78 years.",
            "Who was president of the United States in 1955?",
            "Dwight D. Eisenhower was president of the United States in 1955.",
            "Which party did he belong to?",
            "He belonged to the Republican Party.",
            "How does a telescope work?",
            "Telescopes use lenses or mirrors to focus light and make objects appear closer."
          ]
        ], []);
        responseMessage = answer;
        print(responseMessage);
      }
    } catch (e) {
      print('Could not handle input: [$query], error: $e');
    }

    return responseMessage;
  }
}
