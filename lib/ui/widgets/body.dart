import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happier2/ui/widgets/pie_chart.dart';
import 'package:happier2/utils/constants/colors.dart';

import '../../size_config.dart';
import 'land.dart';
import 'rounded_text_field.dart';
import 'sun.dart';
import 'tabs.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isFullSun = false;
  bool isDayMood = true;
  Duration _duration = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isFullSun = true;
      });
    });
  }

  void changeMood(int activeTabNum) {
    if (activeTabNum == 0) {
      setState(() {
        isDayMood = true;
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          isFullSun = true;
        });
      });
    } else {
      setState(() {
        isFullSun = false;
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          isDayMood = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Color> lightBgColors = [
      const Color(0xFF8C2480),
      const Color(0xFFCE587D),
      const Color(0xFFFF9485),
      if (isFullSun) const Color(0xFFFF9D80),
    ];
    var darkBgColors = [
      const Color(0xFF0D1441),
      const Color(0xFF283584),
      const Color(0xFF376AB2),
    ];
    return AnimatedContainer(
      duration: _duration,
      curve: Curves.easeInOut,
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDayMood ? lightBgColors : darkBgColors,
        ),
      ),
      child: Stack(
        children: [
          Sun(duration: _duration, isFullSun: isFullSun),
          const Land(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacing(
                    of: 50,
                  ),
                  Text(
                    'You look happy!',
                    style: Theme.of(context).textTheme.headline3?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const VerticalSpacing(of: 10),
                  const Text(
                    'You can find a more detailed report below:',
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Flexible(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            height: 280,
                            width: 260,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, top: 10),
                                  child: Text('Detected feelings:',
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18))),
                                ),
                                const PieChartSample3(),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 66),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(primary: SECONDARY_COLOR),
                            onPressed: () {
                              // Respond to button press
                            },
                            icon:
                                const Icon(Icons.keyboard_arrow_right_rounded, size: 30),
                            label: const Text(
                              'Learn more',
                              style: TextStyle(fontSize: 20),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
