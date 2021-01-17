import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:owe/owe/models/professionalizing_option.dart';
import 'package:owe/owe/utils/color_theme.dart';


class TrailsPage extends StatefulWidget {
  @override
  _TrailsPageState createState() => _TrailsPageState();
}

class _TrailsPageState extends State<TrailsPage> {

  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

  Widget gauge(Key key,double value){
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

      appBar: AppBar(title: Text(
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
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
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
                                      ProfessionalizingOption.options[index].title
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
                                    SizedBox(width: 5,),
                                    Text(
                                      ProfessionalizingOption.options[index]
                                          .description,
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

                          gauge(ProfessionalizingOption.options[index].key,ProfessionalizingOption.options[index].progress)

                        ],
                      )),
                ),
              ),
            );
          }),
      ),);
  }
}
