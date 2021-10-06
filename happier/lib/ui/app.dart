import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happier/blocs/current_view/current_view.dart';
import 'package:happier/ui/screens/chatbot.screen.dart';
import 'package:happier/ui/screens/home.screen.dart';
import 'package:happier/ui/screens/objectives.screen.dart';
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
          leading: Image.asset('assets/images/logo.PNG'),
          actions: <Widget>[
            // Icon button profile
            IconButton(
              icon: Icon(
                Icons.account_circle,
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
          if (state is HomeSelected) {
            return const HomeScreen();
          } else if (state is BoardSelected) {
            return const Center(child: Text('Board'));
          } else if (state is ChatbotSelected) {
            return const ChatbotScreen();
          } else if (state is ObjectivesSelected) {
            return const ObjectivesScreen();
          }

          return const HomeScreen();
        }),
        bottomNavigationBar:
            BlocBuilder<CurrentViewBloc, ViewState>(builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.border_all_outlined),
                label: 'Board',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chatbot',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_box_outlined),
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
