import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:owe/owe/models/course.dart';
import 'package:owe/owe/presentation/widgets/formation_card_widget.dart';
import 'package:owe/owe/utils/color_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class FormationPage extends StatefulWidget {
  @override
  _FormationPageState createState() => _FormationPageState();
}

class _FormationPageState extends State<FormationPage>
    with TickerProviderStateMixin {
  AnimationController animationController;

  FilterType categoryType = FilterType.presencial;

  String txt = 'presencial';

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  Widget getButtonUI(FilterType categoryTypeData, bool isSelected) {
    if (FilterType.presencial == categoryTypeData) {
      setState(() {
        txt = 'presencial';
      });
    } else if (FilterType.online == categoryTypeData) {
      setState(() {
        txt = 'online';
      });
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

  List<Marker> _markers = <Marker>[];

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-23.408533, -46.763409),
    zoom: 18.4746,
  );

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _markers.add(Marker(
        markerId: MarkerId('Maquinista'),
        position: LatLng(-23.408523, -46.763419),
        infoWindow: InfoWindow(
            title: 'Maquinista',
            snippet: "Duração:80 horas  Idade Mínima: 18 anos",
            onTap: () {
              launch(
                "https://www.mundosenai.com.br/cursos/qualificacao-profissional/maquinista/",
                forceSafariVC: true,
                forceWebView: true,
                enableJavaScript: true,
              );
            })));

    _markers.add(Marker(
        markerId: MarkerId('Armador de Ferro'),
        position: LatLng(-23.408333, -46.763409),
        infoWindow: InfoWindow(
            title: 'Armador de Ferro',
            snippet: "Duração:180 horas  Idade Mínima: 18 anos",
            onTap: () {
              launch(
                "https://www.mundosenai.com.br/cursos/qualificacao-profissional/armador-de-ferro/",
                forceSafariVC: true,
                forceWebView: true,
                enableJavaScript: true,
              );
            })));

    _markers.add(Marker(
        markerId: MarkerId('Alfaiate'),
        position: LatLng(-23.408533, -46.763809),
        infoWindow: InfoWindow(
            title: 'Alfaiate',
            snippet: "Duração:240 horas  Idade Mínima: 16 anos",
            onTap: () {
              launch(
                "https://www.mundosenai.com.br/cursos/qualificacao-profissional/alfaiate/",
                forceSafariVC: true,
                forceWebView: true,
                enableJavaScript: true,
              );
            })));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white, //Changing this will change the color of the TabBar
      ),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              leading: BackButton(color: Colors.black),
              title: Text("Formações",
                  style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black)),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.map)),
                Tab(icon: Icon(Icons.computer)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Expanded(
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  markers: Set<Marker>.of(_markers),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              Expanded(
                child: FutureBuilder<bool>(
                  future: getData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (!snapshot.hasData) {
                      return const SizedBox();
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 0, right: 16, left: 16),
                        itemCount: Course.popularCourseList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final int count =
                          Course.popularCourseList.length > 10
                              ? 10
                              : Course.popularCourseList.length;
                          final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                  parent: animationController,
                                  curve: Interval(
                                      (1 / count) * index, 1.0,
                                      curve: Curves.fastOutSlowIn)));
                          animationController.forward();

                          return Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Container(
                              height: 150,
                              child: FormationCardWidget(
                                course: Course.popularCourseList[index],
                                animation: animation,
                                animationController: animationController,
                                callback: () {},
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
        ),
      ),
    );


  }
}

enum FilterType {
  presencial,
  online,
}
