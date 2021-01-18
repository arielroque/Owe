class Oportunity {
  Oportunity({
    this.title = '',
    this.imagePath = '',
    this.count = '',
    this.company = '',
    this.description = ''

  });

  String title;
  String count;
  String company;
  String imagePath;
  String description;

  static List<Oportunity> oportunitiesList = <Oportunity>[
    Oportunity(
      imagePath: 'assets/images/trails/oportunity.png',
      title: 'Auxiliar de maquinista',
      count: '13 vagas',
      company: 'CCR',
      description: "Necessita-se de curso profissionalizante de auxiliar de maquinista e é desejável ensino fundamental completo. "
    ),

    Oportunity(
      imagePath: 'assets/images/trails/oportunity.png',
      title: 'Maquinista',
      count: '5 vagas',
      company: 'CCR',
      description: "Necessita-se  de curso profissionalizante de Maquinista e é desejável ensino médio cursando ou completo. "
    ),

    Oportunity(
      imagePath: 'assets/images/trails/oportunity.png',
      title: 'Operador de Trem',
      count: '8 vagas',
      company: 'CCR',
      description: "Necessita-se de ensino médio completo ou superior cursando, além disso é desejável noções básicas de inglês."
    ),

  ];
}
