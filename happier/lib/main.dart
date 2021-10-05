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
}
