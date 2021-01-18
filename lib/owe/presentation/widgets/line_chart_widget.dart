import 'package:fcharts/fcharts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:owe/owe/models/user_perfomance.dart';
import 'package:owe/owe/utils/color_theme.dart';

class CityLineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // set x-axis here so that both lines can use it
    final xAxis = new ChartAxis<String>();

    return new AspectRatio(
      aspectRatio: 4 / 3,
      child: new LineChart(
        chartPadding: new EdgeInsets.fromLTRB(60.0, 20.0, 30.0, 30.0),
        lines: [
          // coolness line

          new Line<UserPerformance, String, int>(
            data: metric1,
            xFn: (city) => city.name,
            yFn: (city) => city.size,
            xAxis: xAxis,
            yAxis: new ChartAxis(
              span: new IntSpan(0, 10),
              opposite: true,
              tickGenerator: IntervalTickGenerator.byN(1),
              paint: const PaintOptions.stroke(color: ColorThemeApp.primaryColor),
              tickLabelerStyle: new TextStyle(color: ColorThemeApp.primaryColor, fontWeight: FontWeight.bold),
            ),
            marker: const MarkerOptions(
              paint: const PaintOptions.fill(color: ColorThemeApp.primaryColor),
              shape: MarkerShapes.square,
            ),
            stroke: const PaintOptions.stroke(color: ColorThemeApp.primaryColor),
            legend: new LegendItem(
              paint: const PaintOptions.fill(color: ColorThemeApp.primaryColor),
              text: 'Recomeço',
            ),
          ),

          // size line
          new Line<UserPerformance, String, int>(
            data: metric2,
            xFn: (city) => city.name,
            yFn: (city) => city.size,
            xAxis: xAxis,
            yAxis: new ChartAxis(
              span: new IntSpan(0, 10),
              opposite: true,
              tickGenerator: IntervalTickGenerator.byN(1),
              paint: const PaintOptions.stroke(color: Colors.black),
              tickLabelerStyle: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            marker: const MarkerOptions(
              paint: const PaintOptions.fill(color: ColorThemeApp.secondColor),
              shape: MarkerShapes.square,
            ),
            stroke: const PaintOptions.stroke(color: ColorThemeApp.secondColor),
            legend: new LegendItem(
              paint: const PaintOptions.fill(color: ColorThemeApp.secondColor),
              text: 'Cursos',
            ),
          ),
        ],
      ),
    );
  }
}