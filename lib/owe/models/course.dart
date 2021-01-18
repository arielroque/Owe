class Course {
  Course({
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.rating = 0.0,
  });

  String title;
  int lessonCount;
  double rating;
  String imagePath;

  static List<Course> popularCourseList = <Course>[
    Course(
      imagePath: 'assets/images/trails/learning.png',
      title: 'Português Básico',
      lessonCount: 24,
      rating: 4.3,
    ),
    Course(
      imagePath: 'assets/images/trails/learning.png',
      title: 'Letramento Digital',
      lessonCount: 22,
      rating: 4.6,
    ),
    Course(
      imagePath: 'assets/images/trails/learning.png',
      title: 'Matemática Básica',
      lessonCount: 34,
      rating: 4.3,
    ),

    Course(
      imagePath: 'assets/images/trails/learning.png',
      title: 'Iniciando no mercado de trabalho',
      lessonCount: 22,
      rating: 4.6,
    ),

    Course(
      imagePath: 'assets/images/trails/learning.png',
      title: 'Higiene e segurança no trabalho',
      lessonCount: 22,
      rating: 4.6,
    )
  ];

  static List<Course> popularFormations = <Course>[
    Course(
      imagePath: 'assets/images/trails/learning.png',
      title: 'Maquinista',
      lessonCount: 50,
      rating: 4.8,
    ),
    Course(
      imagePath: 'assets/images/trails/learning.png',
      title: 'Alfaiate',
      lessonCount: 40,
      rating: 4.4,
    ),
    Course(
      imagePath: 'assets/images/trails/learning.png',
      title: 'Assistente Administrativo',
      lessonCount: 34,
      rating: 4.3,
    ),
  ];
}
