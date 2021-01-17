import 'package:flutter/material.dart';
import 'package:owe/owe/models/course.dart';
import 'package:owe/owe/presentation/widgets/trail_card_widget.dart';

class BeginnerTrailPage extends StatefulWidget {
  final Function callBack;

  const BeginnerTrailPage({Key key, this.callBack}) : super(key: key);

  @override
  _BeginnerTrailPageState createState() => _BeginnerTrailPageState();
}

class _BeginnerTrailPageState extends State<BeginnerTrailPage>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        "Começando",
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
      )),
      body: Column(children: [

        Padding(
          padding: const EdgeInsets.fromLTRB(12,20,12,10),
          child: TextFormField(decoration: InputDecoration(
            hintText: "Pesquise um curso",
          ),),
        ),
        Expanded(child: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return GridView(
                padding: const EdgeInsets.all(8),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: List<Widget>.generate(
                  Course.popularCourseList.length,
                      (int index) {
                    final int count = Course.popularCourseList.length;
                    final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    );
                    animationController.forward();
                    return TrailCardWidget(
                      callback: () {
                        widget.callBack();
                      },
                      course: Course.popularCourseList[index],
                      animation: animation,
                      animationController: animationController,
                    );
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 32.0,
                  crossAxisSpacing: 32.0,
                  childAspectRatio: 0.8,
                ),
              );
            }
          },
        ))
      ],),
    );
  }
}
