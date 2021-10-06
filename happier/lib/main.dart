import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier/blocs/current_view/current_view.dart';
import 'package:happier/ui/app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dialogflow_v2/flutter_dialogflow_v2.dart' as Dialog;

void main() {
  runApp(MultiBlocProvider(providers: <BlocProvider>[
    BlocProvider<CurrentViewBloc>(
      create: (_) => CurrentViewBloc(),
    ),
  ], child: const App()));
}

void initchatbot() async {

  print("[*] Retrieving key ..");
  Dialog.AuthGoogle authGoogle =
      await Dialog.AuthGoogle(fileJson: 'assets/happier-dialog_flow_key.json')
          .build();
  print("[*] Done");
  /*Dialog.Dialogflow dialogflow =
      Dialog.Dialogflow(authGoogle: authGoogle, sessionId: '123456');
  Dialog.DetectIntentResponse response = await dialogflow.detectIntent(
    Dialog.DetectIntentRequest(
      queryInput: Dialog.QueryInput(
        text: Dialog.TextInput(
          text: 'Hello !',
          languageCode: Dialog.Language.english,
        ),
      ),
      queryParams: Dialog.QueryParameters(
        resetContexts: true,
      ),
    ),
  );
  */
  //response.queryResult.queryText;
}