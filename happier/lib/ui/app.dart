import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happier/blocs/current_view/current_view.dart';
import 'package:happier/blocs/objectives/objectives.dart';
import 'package:happier/ui/screens/board.screen.dart';
import 'package:happier/ui/screens/chatbot.screen.dart';
import 'package:happier/ui/screens/help.screen.dart';
import 'package:happier/ui/screens/faq.screen.dart';
import 'package:happier/ui/screens/objectives.screen.dart';
import 'package:happier/utils/constants/colors.dart';
import 'package:happier/utils/helpers/create_material_color.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:url_launcher/url_launcher.dart';

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
              titleText = 'Hap';
            } else if (state is ObjectivesSelected) {
              titleText = 'Objectives';
            } else if (state is HelpSelected) {
              titleText = 'Account';
            } else if (state is FAQSelected) {
              titleText = 'FAQ';
            }
            return Center(
                child: Text(
              titleText,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF504538)),
            ));
          }),
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/images/logo-appbar.png'),
          ),
          actions: <Widget>[
            // Icon button profile
            BlocBuilder<CurrentViewBloc, ViewState>(builder: (context, state) {
              if (state is HelpSelected) {
                return IconButton(
                  icon: const Icon(
                    Icons.help,
                    color: PRIMARY_COLOR,
                  ),
                  onPressed: () => BlocProvider.of<CurrentViewBloc>(context)
                      .add(ViewRequested(view: FAQSelected())),
                );
              }
              if (state is ChatbotSelected) {
                return IconButton(
                  icon: const Icon(
                    Icons.account_circle,
                    color: PRIMARY_COLOR,
                  ),
                  onPressed: () => BlocProvider.of<CurrentViewBloc>(context)
                      .add(ViewRequested(view: HelpSelected())),
                );
              }
              // Default AppBar icon
              return IconButton(
                icon: const Icon(
                  FeatherIcons.phone,
                  color: PRIMARY_COLOR,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPhonePopupDialog(context));
                },
              );
            })
          ],
        ),
        body:
            BlocBuilder<CurrentViewBloc, ViewState>(builder: (context, state) {
          if (state is BoardSelected) {
            return const BoardScreen();
          } else if (state is ChatbotSelected) {
            return const ChatbotScreen();
          } else if (state is ObjectivesSelected) {
            return BlocProvider<ObjectivesBloc>(
                create: (_) => ObjectivesBloc()..add(ObjectivesRequested()),
                child: const ObjectivesScreen());
          } else if (state is HelpSelected) {
            return const HelpScreen();
          } else if (state is FAQSelected) {
            return const FAQScreen();
          }

          return const BoardScreen();
        }),
        bottomNavigationBar:
            BlocBuilder<CurrentViewBloc, ViewState>(builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.home),
                label: 'Board',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.messageCircle),
                label: 'Chatbot',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.calendar),
                label: 'Objectives',
              ),
            ],
            // Checking state.viewId in order to not highlight any item when screen not in navMenu is active
            currentIndex: state.viewId > 2 ? 2 : state.viewId,
            selectedItemColor:
                state.viewId > 2 ? SECONDARY_COLOR : PRIMARY_COLOR,
            unselectedItemColor: SECONDARY_COLOR,
            showSelectedLabels: false,
            showUnselectedLabels: false,
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

Widget _buildPhonePopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Numbers'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text('Click a link below in order to call the help line:'),
        ),
        GestureDetector(
          child: Text(
            'Urgent emergency (112)',
            style: TextStyle(color: Colors.blue[800], decoration: TextDecoration.underline, fontSize: 22),
          ),
          onTap: () => launch('tel://112'),
        ),
        GestureDetector(
          child: Text(
            'Suicide line (90101)',
            style: TextStyle(color: Colors.blue[800], decoration: TextDecoration.underline, fontSize: 22),
          ),
          onTap: () => launch('tel://90101'),
        ),
        GestureDetector(
          child: Text(
            'Healthcare advice (1177)',
            style: TextStyle(color: Colors.blue[800], decoration: TextDecoration.underline, fontSize: 22),
          ),
          onTap: () => launch('tel://1177'),
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
    ],
  );
}
