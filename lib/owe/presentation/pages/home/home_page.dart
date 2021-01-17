import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:owe/owe/models/option.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 20),
              child: Text("Suas Trilhas",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            ),
          ],
        ),
        Expanded(child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: Option.homeOptions.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  child: Container(
                    height: 160,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Option.homeOptions[index].color,
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        Option.homeOptions[index].title
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(width: 5,),
                                      Text(
                                        Option.homeOptions[index]
                                            .description,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Image.asset(Option.homeOptions[index].image,width: 122,height: 150,)
                          ],
                        )),
                  ),
                ),
              );
            }))
      ],

    ),);
  }
}
