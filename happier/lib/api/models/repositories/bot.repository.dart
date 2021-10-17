import 'package:dialog_flowtter/dialog_flowtter.dart';

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
    } catch (e) {
      print('Could not handle input: $e');
    }

    return responseMessage;
  }
}
