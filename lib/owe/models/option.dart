import 'package:flutter/cupertino.dart';

class Option {
  Option({
    this.title = '',
    this.image = '',
    this.description = '',
    this.color
  });

  String title;
  String description;
  String image;
  Color color;

  static List<Option> homeOptions = <Option>[
    Option(
      image: 'assets/images/trails/entrepreneur_trail.png',
      title: 'Recomeço',
      description: "Receba microcertificações \nao avançar nas trilhas \nde aprendizagem.",
      color: Color(0xffC2D1F0)),
    Option(
      image: 'assets/images/trails/entrepreneur_trail.png',
      title: 'Cursos',
      description: 'Veja quais são os cursos \nprofissionalizantes \ndisponívei online \n e presenciais.',
      color: Color(0xffF8CCE0)
    ),
    Option(
      image: 'assets/images/trails/academic_trail.png',
      title: 'Mural de \n Oportunidades',
      description: "Descubra oportunidades \nde emprego próximas a você.",
        color: Color(0xffE3E4EB)
    ),
  ];
}
