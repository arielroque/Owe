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
      imagePath: 'assets/images/trails/beginning/course.png',
      title: 'Português Básico',
      lessonCount: 24,
      rating: 4.3,
    ),
    Course(
      imagePath: 'assets/images/trails/beginning/course.png',
      title: 'Letramento Digital',
      lessonCount: 22,
      rating: 4.6,
    ),
    Course(
      imagePath: 'assets/images/trails/beginning/course.png',
      title: 'Matemática Básica',
      lessonCount: 34,
      rating: 4.3,
    ),

    Course(
      imagePath: 'assets/images/trails/beginning/course.png',
      title: 'Iniciando no mercado de trabalho',
      lessonCount: 22,
      rating: 4.6,
    ),

    Course(
      imagePath: 'assets/images/trails/beginning/course.png',
      title: 'Higiene e segurança no trabalho',
      lessonCount: 22,
      rating: 4.6,
    )
  ];
}
