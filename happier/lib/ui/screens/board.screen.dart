import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.all(10.0),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Emotion Board',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFF444444)),
          ),
        ),
      ),

      // TITLE

      // STATISTICS LABEL
      Container(
          margin: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: const [
                  Text(
                    'Current Week',
                    style: TextStyle(
                      color: Color(0xFF444444),
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text(
                    'Last Week',
                    style: TextStyle(
                      color: Color(0xFF444444),
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text(
                    'Last Month',
                    style: TextStyle(
                      color: Color(0xFF444444),
                    ),
                  ),
                ],
              ),
            ],
          )),

      // PIE CHARTS
      Container(
          margin: const EdgeInsets.all(10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Expanded(
              child: Container(
                  child: Column(children: [
                    Container(
                        width: 100,
                        height: 100,
                        child: PieChart(
                          PieChartData(sections: [
                            PieChartSectionData(
                                color: const Color(0xFF728D6E),
                                value: 80,
                                showTitle: false,
                                radius: 10),
                            PieChartSectionData(
                                color: const Color(0xFFEFEFEF),
                                value: 20,
                                showTitle: false,
                                radius: 10)
                          ], startDegreeOffset: 270),
                          swapAnimationDuration:
                              const Duration(milliseconds: 150),
                          // Optional
                          swapAnimationCurve: Curves.linear, // Optional
                        ))

                    //Text('CHART1')
                  ])),
            ),
                Expanded(
                  child: Container(
                      child: Column(children: [
                        Container(
                            width: 100,
                            height: 100,
                            child: PieChart(
                              PieChartData(sections: [
                                PieChartSectionData(
                                    color: const Color(0xFF969E7F),
                                    value: 60,
                                    showTitle: false,
                                    radius: 10),
                                PieChartSectionData(
                                    color: const Color(0xFFEFEFEF),
                                    value: 40,
                                    showTitle: false,
                                    radius: 10)
                              ], startDegreeOffset: 270),
                              swapAnimationDuration:
                              const Duration(milliseconds: 150),
                              // Optional
                              swapAnimationCurve: Curves.linear, // Optional
                            ))

                        //Text('CHART1')
                      ])),
                ),
                Expanded(
                  child: Container(
                      child: Column(children: [
                        Container(
                            width: 100,
                            height: 100,
                            child: PieChart(
                              PieChartData(sections: [
                                PieChartSectionData(
                                    color: const Color(0xFFB6AF95),
                                    value: 50,
                                    showTitle: false,
                                    radius: 10),
                                PieChartSectionData(
                                    color: const Color(0xFFEFEFEF),
                                    value: 50,
                                    showTitle: false,
                                    radius: 10)
                              ], startDegreeOffset: 270),
                              swapAnimationDuration:
                              const Duration(milliseconds: 150),
                              // Optional
                              swapAnimationCurve: Curves.linear, // Optional
                            ))

                        //Text('CHART1')
                      ])),
                )
          ])),

      Container(
        margin: const EdgeInsets.all(10.0),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Hap\'s thoughts',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF444444)),
          ),
        ),
      ),

      // STATISTICS LABEL
      Container(
        margin: const EdgeInsets.all(10.0),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'I have a feeling that you are a little bit sad about the last week, can we continue our discussion? If you want, you can just try to make some activities that i gave you on your objectives list',
            style: TextStyle(fontSize: 16, color: Color(0xFF444444)),
          ),
        ),
      ),

      Container(
        margin: const EdgeInsets.all(10.0),
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Articles that might be interesting',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF444444)),
          ),
        ),
      ),
    ]);
  }
}
