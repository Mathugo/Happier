import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier2/blocs/current_view/current_view.dart';
import 'package:happier2/ui/app.dart';
import 'package:happier2/ui/screens/camera.screen.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MultiBlocProvider(providers: <BlocProvider>[
    BlocProvider<CurrentViewBloc>(
      create: (_) => CurrentViewBloc(),
    ),
  ], child: App(cameras: cameras)));
}
