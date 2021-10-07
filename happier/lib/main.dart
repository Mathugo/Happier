import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier/blocs/current_view/current_view.dart';
import 'package:happier/ui/app.dart';

void main() {
  runApp(MultiBlocProvider(providers: <BlocProvider>[
    BlocProvider<CurrentViewBloc>(
      create: (_) => CurrentViewBloc(),
    ),
  ], child: const App()));
  //initDialogFlow();
}

// Future<void> initDialogFlow() async {
//   DialogAuthCredentials credentials =
//       await DialogAuthCredentials.fromFile('assets/dialog_flow_auth.json');

//   DialogFlowtter instance = DialogFlowtter(
//     credentials: credentials,
//   );

//   print('Initialized dialogFlow!');

//   final QueryInput queryInput = QueryInput(
//     text: TextInput(
//       text: "Hi. How are you?",
//       languageCode: "en",
//     ),
//   );

//   DetectIntentResponse response = await instance.detectIntent(
//     queryInput: queryInput,
//   );

//   String? textResponse = response.text;

//   print('dialogFlow response: $textResponse'); // Hi, how may I help you?
// }

// void initchatbot() async {
//   print("[*] Retrieving key ..");
//   Dialog.AuthGoogle authGoogle =
//       await Dialog.AuthGoogle(fileJson: 'assets/happier-dialog_flow_key.json')
//           .build();
//   print("[*] Done");
//   /*Dialog.Dialogflow dialogflow =
//       Dialog.Dialogflow(authGoogle: authGoogle, sessionId: '123456');
//   Dialog.DetectIntentResponse response = await dialogflow.detectIntent(
//     Dialog.DetectIntentRequest(
//       queryInput: Dialog.QueryInput(
//         text: Dialog.TextInput(
//           text: 'Hello !',
//           languageCode: Dialog.Language.english,
//         ),
//       ),
//       queryParams: Dialog.QueryParameters(
//         resetContexts: true,
//       ),
//     ),
//   );
//   */
//   //response.queryResult.queryText;
// }