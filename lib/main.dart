import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happier2/blocs/current_view/current_view.bloc.dart';
import 'package:happier2/ui/screens/camera.screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: <BlocProvider>[BlocProvider(create: (_) => CurrentViewBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Camera App',
        home: CameraScreen(cameras: cameras),
      ),
    );
  }
}
