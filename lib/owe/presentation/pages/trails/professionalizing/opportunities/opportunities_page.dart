import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:owe/owe/models/course.dart';
import 'package:owe/owe/models/oportunity.dart';
import 'package:owe/owe/presentation/widgets/formation_card_widget.dart';
import 'package:owe/owe/presentation/widgets/opportunity_card_widget.dart';
import 'package:owe/owe/utils/color_theme.dart';

class OpportunitiesPage extends StatefulWidget {
  @override
  _OpportunitiesPageState createState() => _OpportunitiesPageState();
}

class _OpportunitiesPageState extends State<OpportunitiesPage>
    with TickerProviderStateMixin {
  AnimationController animationController;

  FilterType categoryType = FilterType.presencial;

  String txt = '';

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
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
          leading: BackButton(color: Colors.black),
          title: Text("Mural de Oportunidades",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black))),
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return ListView.builder(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
              itemCount: Opportunity.oportunitiesList.length,
              itemBuilder: (BuildContext context, int index) {
                final int count = Opportunity.oportunitiesList.length > 10
                    ? 10
                    : Opportunity.oportunitiesList.length;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animationController,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                animationController.forward();

                return Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Container(
                    height: 150,
                    child: OpportunityCardWidget(
                      opportunity: Opportunity.oportunitiesList[index],
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
    );
  }
}

enum FilterType {
  presencial,
  online,
}
