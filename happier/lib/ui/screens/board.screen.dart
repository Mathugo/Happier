import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

final List<String> imgList = [
  'https://www.bioessetech.com/wp-content/uploads/2018/12/woman-sleeping-in-white-bed_4460x4460-1170x780.jpg',
  'https://miro.medium.com/max/8000/1*0ej1mPtjdME8wdjGGTUL7A.jpeg',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://miro.medium.com/max/10944/1*pkAqr2OTMiIiYPYP2yig4g.jpeg',
];

final List<String> titlesList = [
  'Self care for sleep',
  'Improve your well-being',
  'Five self-care practices',
  'The importance of meditation',
];

final List<String> urlsList = [
  'https://thesleepcharity.org.uk/self-care-for-sleep/',
  'https://medium.com/mind-cafe/6-simple-ways-to-live-your-best-life-8522aacc3323',
  'https://www.verywellmind.com/self-care-strategies-overall-stress-reduction-3144729',
  'https://medium.com/mind-cafe/the-importance-of-meditation-42122d25de4a',
];

void _launchURL(int index) async => await canLaunch(urlsList[index])
    ? await launch(urlsList[index])
    : throw 'Could not launch URL';

final List<Widget> imageSliders = imgList
    .map((item) => GestureDetector(
          onTap: () => _launchURL(imgList.indexOf(item)),
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    CachedNetworkImage(
                        imageUrl: item,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                        width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          titlesList[imgList.indexOf(item)],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class BoardScreen extends StatelessWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(children: <Widget>[
      Column(children: [
        Container(
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 15),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Emotion board',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xFF444444)),
            ),
          ),
        ),
        // PIE CHARTS
        Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: const Text('Current week')),
                      SizedBox(
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
                    ]),
                  ),
                  Expanded(
                    child: Column(children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: const Text('Last week')),
                      SizedBox(
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
                    ]),
                  ),
                  Expanded(
                    child: Column(children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: const Text('Last month')),
                      SizedBox(
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
                    ]),
                  )
                ])),

        Container(
          margin:
              const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 15),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hap\'s thoughts',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Color(0xFF444444)),
            ),
          ),
        ),

        // STATISTICS LABEL
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'I have a feeling that you might be a little sad about last week, can we continue our discussion? If you want, you can just try to complete some of the activities that I gave you on your objectives list.',
              style: TextStyle(fontSize: 16, color: Color(0xFF444444)),
            ),
          ),
        ),

        Container(
          margin:
              const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 15),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Articles that might interest you',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xFF444444)),
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: false,
                enableInfiniteScroll: kIsWeb ? true : false,
                initialPage: 0,
                autoPlay: kIsWeb ? true : false,
                autoPlayInterval: const Duration(seconds: 6),
              ),
              items: imageSliders,
            ))
      ])
    ]));
  }
}
