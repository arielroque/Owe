import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:owe/owe/models/course.dart';

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key key,
      this.category,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback callback;
  final Course category;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                callback();
              },
              child: SizedBox(
                height: 280,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFF8FAFB),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                                // border: new Border.all(
                                //     color: DesignCourseAppTheme.notWhite),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16, left: 16, right: 16),
                                            child: Text(
                                              category.title,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                letterSpacing: 0.27,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8,
                                                left: 16,
                                                right: 16,
                                                bottom: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  '${category.lessonCount} aulas',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 12,
                                                    letterSpacing: 0.27,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                        '${category.rating}',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w200,
                                                          fontSize: 18,
                                                          letterSpacing: 0.27,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.blue,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 48,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 24, right: 16, left: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 6.0),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            child: AspectRatio(
                                aspectRatio: 1.28,
                                child: Image.asset(category.imagePath)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
