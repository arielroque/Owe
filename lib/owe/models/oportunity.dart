class Opportunity {
  Opportunity({
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

  static List<Opportunity> oportunitiesList = <Opportunity>[
    Opportunity(
      imagePath: 'assets/images/trails/oportunity.png',
      title: 'Auxiliar de maquinista',
      count: '13 vagas',
      company: 'CCR',
      description: "Necessita-se de curso profissionalizante de auxiliar de maquinista e é desejável ensino fundamental completo. "
    ),

    Opportunity(
      imagePath: 'assets/images/trails/oportunity.png',
      title: 'Maquinista',
      count: '5 vagas',
      company: 'CCR',
      description: "Necessita-se  de curso profissionalizante de Maquinista e é desejável ensino médio cursando ou completo. "
    ),

    Opportunity(
      imagePath: 'assets/images/trails/oportunity.png',
      title: 'Operador de Trem',
      count: '8 vagas',
      company: 'CCR',
      description: "Necessita-se de ensino médio completo ou superior cursando, além disso é desejável noções básicas de inglês."
    ),

  ];
}
