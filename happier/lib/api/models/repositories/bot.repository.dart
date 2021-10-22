import 'package:dialog_flowtter/dialog_flowtter.dart';

import 'gpt3.dart';

/*
     "Who was president of the United States in 1955?",
            "Dwight D. Eisenhower was president of the United States in 1955.",
            "Which party did he belong to?",
            "He belonged to the Republican Party.",
            "How does a telescope work?",
            "Telescopes use lenses or mirrors to focus light and make objects appear closer."
          ]
          */

class BotRepository {
  final DialogFlowtter _dialogInstance;
  BotRepository(this._dialogInstance);

  Future<String?> detectIntent(String query) async {
    String? responseMessage;
    try {
      DetectIntentResponse response = await _dialogInstance.detectIntent(
        queryInput: QueryInput(text: TextInput(text: query)),
      );
      responseMessage = response.text;
      // our bot didn't get that so we switch to gpt-3
/*
      if (responseMessage == "none") {
        print("[*] Switching to gpt-3 ..");
        print(query);
        String answer = await openAI.answer(query);

        responseMessage = answer;
        print(responseMessage);
      }
      */
    } catch (e) {
      print('Could not handle input: [$query], error: $e');
    }

    return responseMessage;
  }
}
