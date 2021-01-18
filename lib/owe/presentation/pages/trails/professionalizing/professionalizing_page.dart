import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:owe/owe/models/professionalizing_option.dart';
import 'package:owe/owe/presentation/pages/trails/professionalizing/beginning/beginnner_trail_page.dart';
import 'package:owe/owe/presentation/pages/trails/professionalizing/formation/formation_page.dart';
import 'package:owe/owe/utils/color_theme.dart';
import 'opportunities/opportunities_page.dart';

class ProfessionalizingPage extends StatefulWidget {
  @override
  _ProfessionalizingPageState createState() => _ProfessionalizingPageState();
}

class _ProfessionalizingPageState extends State<ProfessionalizingPage> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  Widget gauge(Key key, double value) {
    return AnimatedCircularChart(
      key: key,
      size: const Size(125.0, 125.0),
      initialChartData: <CircularStackEntry>[
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              value,
              ColorThemeApp.secondColor,
              rankKey: 'completed',
            ),
            new CircularSegmentEntry(
              (100 - value),
              Colors.white,
              rankKey: 'remaining',
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      percentageValues: true,
      holeLabel: '$value %',
      labelStyle: new TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          title: Text(
        "Trilha Profissionalizante",
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      )),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: ProfessionalizingOption.options.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BeginnerTrailPage(),
                        ));
                  } else if (index == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormationPage(),
                        ));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OpportunitiesPage(),
                        ));
                  }
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  child: Container(
                    height: 160,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: ProfessionalizingOption.options[index].color,
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        ProfessionalizingOption
                                            .options[index].title
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        ProfessionalizingOption
                                            .options[index].description,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            gauge(ProfessionalizingOption.options[index].key,
                                ProfessionalizingOption.options[index].progress)
                          ],
                        )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
