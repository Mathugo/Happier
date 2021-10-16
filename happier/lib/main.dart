import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier/api/models/chat_message.dart';
import 'package:happier/api/models/objective.dart';
import 'package:happier/blocs/current_view/current_view.dart';
import 'package:happier/ui/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initHive();
  runApp(MultiBlocProvider(providers: <BlocProvider>[
    BlocProvider<CurrentViewBloc>(
      create: (_) => CurrentViewBloc(),
    ),
  ], child: const App()));
  initDialogFlow();
}

Future<void> initDialogFlow() async {
  print('[*] Getting credentials ..');
  DialogAuthCredentials credentials =
      await DialogAuthCredentials.fromFile('assets/credentials.json');
  DialogFlowtter instance = DialogFlowtter(
    credentials: credentials,
  );
  print('[*] Done');
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ChatMessageAdapter());
  Hive.registerAdapter(ObjectiveAdapter());
}