import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:owe/owe/utils/color_theme.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ColorThemeApp.primaryColor,
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                Image.asset("assets/images/persona/persona.png")
                                    .image))),
                Text(
                  "@Thamires",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                    ),
                    Text("1000",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w400))
                  ],
                )
              ],
            ),
          ),
          StepProgressIndicator(
            totalSteps: 4,
            padding: 1.0,
            size: 20,
            customStep: (index, color, _) => index == 0
                ? Container(
                    color: Colors.green,
                    child: Text("EF1"),
                  )
                : index == 1
                    ? Container(
                        color: Colors.green,
                        child: Text("EF2"),
                      )
                    : index == 2
                        ? Container(
                            color: Colors.green,
                            child: Text("EM"),
                          )
                        : Container(
                            color: Colors.deepOrange,
                            child: Text("ES"),
                          ),
            customColor: (index) =>
                index <= 2 ? Colors.green : Colors.deepOrange,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sobre Mim",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                TextFormField(
                  enableInteractiveSelection: false,
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Sou toooper",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Medalhas",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                Image.asset("assets/images/medals/medals.png")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Desempenho",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
