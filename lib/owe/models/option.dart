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
      title: 'Empreendedora',
      description: "Trilha Empreendedora",
      color: Color(0xffC2D1F0)),
    Option(
      image: 'assets/images/trails/entrepreneur_trail.png',
      title: 'Profissional',
      description: 'Trilha Profissionalizante',
      color: Color(0xffF8CCE0)
    ),
    Option(
      image: 'assets/images/trails/academic_trail.png',
      title: 'Escolar',
      description: "Trilha acadêmica",
        color: Color(0xffE3E4EB)
    ),
  ];
}
