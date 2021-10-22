import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier/api/models/chat_message.dart';
import 'package:happier/api/models/objective.dart';
import 'package:happier/api/models/repositories/bot.repository.dart';
import 'package:happier/blocs/current_view/current_view.dart';
import 'package:happier/ui/app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'blocs/chat/chat.dart';
import 'package:happier/api/models/repositories/gpt3.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHive();
  final DialogFlowtter flowInstance = await initDialogFlow();
  final BotRepository botRepository = BotRepository(flowInstance);

  runApp(MultiBlocProvider(providers: <BlocProvider>[
    BlocProvider<CurrentViewBloc>(
      create: (_) => CurrentViewBloc(),
    ),
    BlocProvider<ChatBloc>(
        create: (_) => ChatBloc(botRepository)..add(UpdateChat())),
  ], child: const App()));
}

Future<DialogFlowtter> initDialogFlow() async {
  DialogAuthCredentials credentials =
      await DialogAuthCredentials.fromFile('assets/credentials.json');
  DialogFlowtter instance = DialogFlowtter(
    credentials: credentials,
  );
  print('[*] Initialized dialogFlow');
  return instance;
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ChatMessageAdapter());
  Hive.registerAdapter(ObjectiveAdapter());
}
