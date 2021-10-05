import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happier/blocs/current_view/current_view.dart';
import 'package:happier/ui/screens/home.screen.dart';
import 'package:happier/utils/constants/colors.dart';
import 'package:happier/utils/helpers/create_material_color.dart';

class App extends StatelessWidget {
  static const TITLE = 'Happier';

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happier',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
        fontFamily: 'Lato',
        brightness: Brightness.light,
        primaryColor: Colors.orange[100],
        primarySwatch: createMaterialColor(const Color(0xFFFFF2E3)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(TITLE),
        ),
        body:
            BlocBuilder<CurrentViewBloc, ViewState>(builder: (context, state) {
          print('Current ViewState: $state');

          if (state is HomeSelected) {
            return const HomeScreen();
          } else if (state is BoardSelected) {
            return const Text('Board');
          } else if (state is ChatbotSelected) {
            return const Text('Chatbot');
          } else if (state is ObjectivesSelected) {
            return const Text('Objectives');
          }

          return const HomeScreen();
        }),
        bottomNavigationBar:
            BlocBuilder<CurrentViewBloc, ViewState>(builder: (context, state) {
          print('Current viewId: ${state.viewId}');

          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_alarm),
                label: 'Board',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Chatbot',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sanitizer),
                label: 'Objectives',
              ),
            ],
            currentIndex: state.viewId,
            selectedItemColor: PRIMARY_COLOR,
            unselectedItemColor: SECONDARY_COLOR,
            onTap: (int i) => _onNavigationTap(i, context),
          );
        }),
      ),
    );
  }

  void _onNavigationTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        BlocProvider.of<CurrentViewBloc>(context)
            .add(ViewRequested(view: HomeSelected()));
        break;
      case 1:
        BlocProvider.of<CurrentViewBloc>(context)
            .add(ViewRequested(view: BoardSelected()));
        break;
      case 2:
        BlocProvider.of<CurrentViewBloc>(context)
            .add(ViewRequested(view: ChatbotSelected()));
        break;
      case 3:
        BlocProvider.of<CurrentViewBloc>(context)
            .add(ViewRequested(view: ObjectivesSelected()));
        break;
    }
  }
}
