import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happier2/blocs/current_view/current_view.dart';
import 'package:happier2/ui/screens/board.screen.dart';
import 'package:happier2/utils/constants/colors.dart';
import 'package:happier2/utils/helpers/create_material_color.dart';

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
        primaryColor: PRIMARY_COLOR,
        primarySwatch: createMaterialColor(SECONDARY_COLOR),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<CurrentViewBloc, ViewState>(
              builder: (context, state) {
            String titleText = TITLE;
            if (state is BoardSelected) {
              titleText = 'Board';
            } else if (state is ChatbotSelected) {
              titleText = 'Camera';
            } else if (state is ObjectivesSelected) {
              titleText = 'Settings';
            }
            return Center(child: Text(
              titleText,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF504538)),
            ));
          }),
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/images/logo-appbar.png'),
          ),
          actions: <Widget>[
            // Icon button profile
            IconButton(
              icon: const Icon(
                Icons.phone,
                color: PRIMARY_COLOR,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
        ),
        body:
            BlocBuilder<CurrentViewBloc, ViewState>(builder: (context, state) {
          if (state is BoardSelected) {
            return const BoardScreen();
          } else if (state is ChatbotSelected) {
            return const Text('');
          } else if (state is ObjectivesSelected) {
            return const Text('');
          }

          return const BoardScreen();
        }),
        bottomNavigationBar:
            BlocBuilder<CurrentViewBloc, ViewState>(builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Board',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: 'Camera',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: state.viewId,
            selectedItemColor: PRIMARY_COLOR,
            unselectedItemColor: SECONDARY_COLOR,
            showSelectedLabels: false,
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
            .add(ViewRequested(view: BoardSelected()));
        break;
      case 1:
        BlocProvider.of<CurrentViewBloc>(context)
            .add(ViewRequested(view: ChatbotSelected()));
        break;
      case 2:
        BlocProvider.of<CurrentViewBloc>(context)
            .add(ViewRequested(view: ObjectivesSelected()));
        break;
    }
  }
}
