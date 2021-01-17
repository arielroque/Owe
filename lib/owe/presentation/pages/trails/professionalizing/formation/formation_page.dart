import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:owe/owe/models/course.dart';
import 'package:owe/owe/presentation/widgets/formation_card_widget.dart';
import 'package:owe/owe/utils/color_theme.dart';

class FormationPage extends StatefulWidget {
  @override
  _FormationPageState createState() => _FormationPageState();
}

class _FormationPageState extends State<FormationPage>
    with TickerProviderStateMixin {
  AnimationController animationController;

  FilterType categoryType = FilterType.presencial;

  String txt = '';

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  Widget getButtonUI(FilterType categoryTypeData, bool isSelected) {
    if (FilterType.presencial == categoryTypeData) {
      setState(() {
        txt = 'presencial';
      });

      print("fodofodfdf");

    } else if (FilterType.online == categoryTypeData) {
      setState(() {
        txt = 'online';
      });

      print("online");
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? ColorThemeApp.secondColor : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: Colors.grey)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color:
                        isSelected ? Colors.white : ColorThemeApp.secondColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget formationFilter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Filtrar',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(
                  FilterType.presencial, categoryType == FilterType.presencial),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(FilterType.online, categoryType == FilterType.online),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
              color: Colors.black
          ),
          title: Text("Formações",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: formationFilter(),
          ),
          if (txt == "online")
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ),

          if (txt == "presencial")
          Expanded(
            child: FutureBuilder<bool>(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 0, right: 16, left: 16),
                    itemCount: Course.popularCourseList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final int count = Course.popularCourseList.length > 10
                          ? 10
                          : Course.popularCourseList.length;
                      final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                      animationController.forward();

                      return Padding(
                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                        child: Container(
                          height: 150,
                          child: FormationCardWidget(
                            course: Course.popularCourseList[index],
                            animation: animation,
                            animationController: animationController,
                            callback: () {
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

enum FilterType {
  presencial,
  online,
}
