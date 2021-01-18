import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class ProfessionalizingOption {
  ProfessionalizingOption(
      {this.title = '',
      this.progress = 0,
      this.description = '',
      this.color,
      this.key});

  Key key;
  String title;
  String description;
  double progress;
  Color color;

  static List<ProfessionalizingOption> options =
      <ProfessionalizingOption>[
    ProfessionalizingOption(
        key: GlobalKey<AnimatedCircularChartState>(),
        progress: 70.0,
        title: 'Começando',
        description: "Inicie sua Jornada aqui",
        color: Color(0xffC2D1F0)),
    ProfessionalizingOption(
        key: GlobalKey<AnimatedCircularChartState>(),
        progress: 40.0,
        title: 'Formações',
        description: 'Formações profissionais',
        color: Color(0xffF8CCE0)),
    ProfessionalizingOption(
        progress: 0,
        key: GlobalKey<AnimatedCircularChartState>(),
        title: 'Oportunidades',
        description: "Oportunidades próximas",
        color: Color(0xffE3E4EB)),
  ];
}
