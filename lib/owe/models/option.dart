import 'package:flutter/cupertino.dart';

class Option {
  Option({
    this.title = '',
    this.data = '',
    this.description = '',
    this.color
  });

  String title;
  String description;
  double rating;
  String data;
  Color color;

  static List<Option> professionalizingOptions = <Option>[
    Option(
      data: '70.0',
      title: 'Começando',
      description: "Inicie sua Jornada aqui",
      color: Color(0xffC2D1F0)),
    Option(
      data: '40.0',
      title: 'Formações',
      description: 'Formações profissionais',
      color: Color(0xffF8CCE0)
    ),
    Option(
      data: '0',
      title: 'Oportunidades',
      description: "Oportunidades próximas",
        color: Color(0xffE3E4EB)
    ),
  ];
}
