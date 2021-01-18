import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:owe/owe/presentation/pages/home/home_navigation.dart';
import 'package:dio/dio.dart';
import 'package:owe/owe/utils/constants.dart';

class QuestionnairePage extends StatefulWidget {
  static const String id = "questionnaire_page";

  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  final _pageViewController = PageController();
  final _formKey = GlobalKey<FormState>();

  List<Widget> _pages;
  List<String> ageRangeList = [
    "menor que 18",
    "18 aos 24",
    "25 aos 30",
    "31 aos 39",
    "acima dos 40"
  ];
  List<String> schoolingList = [
    "ensino fundamental incompleto",
    "ensino fundamental completo",
    "ensino médio incompleto",
    "ensino médio completo",
    "outros"
  ];

  List<String> familiarAverageSalaryList = [
    "até 1 salário mínimo",
    "de 2 a 4 salários mínimos",
    "de 4 a 10 salários mínimos",
    "Acima de 10 salários mínimos"
  ];

  List<String> timeToPlayActivitiesList = [
    "Até 2 horas",
    "De 2 - 4 horas",
    "De 4 - 6 horas",
    "De 6 - 8 horas",
    "De 8 - 10 horas",
    "Mais de 10 horas"
  ];

  List<String> doCourseList = ["Sim", "não", "Ainda não decidi"];

  double _formProgress = 0.15;

  bool suggestionsRemovable = false;
  bool isRegisterPress = false;

  String ageRangeSelected;
  String schoolingSelected;
  String activityTime;
  String familiarAverageSalarySelected;
  String doCourseSelected;
  String citySelected;

  final _textController = TextEditingController();

  void saveQuestionnaire() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                width: 5,
              ),
              Text("Registrando"),
            ],
          ),
        );
      },
    );

    String userWish = _textController.text;

    Response response = await Dio()
        .post("https://owe-monolithic.herokuapp.com/registerUserData", data: {
      "age_range": ageRangeSelected,
      "schooling": schoolingSelected,
      "average_salary": familiarAverageSalarySelected,
      "do_course": doCourseSelected,
      "activity time": activityTime,
      "user_wish": userWish
    });

    if (response.data["status"] == Constants.success) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeNavigation(),
          ));
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new Text("Ocorreu um erro, tente novamente"),
              ],
            ),
          );
        },
      );
    }
  }

  void goBack() {
    _formProgress -= 1 / _pages.length;
    _pageViewController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
    suggestionsRemovable = false;
    FocusScope.of(context).unfocus();
  }

  void goNext() {
    _formProgress += 1 / _pages.length;
    _pageViewController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
    suggestionsRemovable = false;
    FocusScope.of(context).unfocus();
  }

  void goToSchools() {
    _formProgress += 2 / _pages.length;
    _pageViewController.jumpToPage(3);

    suggestionsRemovable = false;
    FocusScope.of(context).unfocus();
  }

  Widget page1() {
    return buildPage(
        pageIndex: 1,
        description:
            "Para que nossos direcionamentos sejam mais precisos necessitamos saber mais algumas informações suas",
        components: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Qual a sua faixa etária?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: ageRangeSelected,
              iconSize: 24,
              isExpanded: true,
              hint: Text("Clique Aqui"),
              elevation: 16,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Selecione a faixa etária";
                }
                return null;
              },
              autovalidate: true,
              style: TextStyle(color: Colors.black),
              onChanged: (String value) {
                setState(() {
                  ageRangeSelected = value;
                });
              },
              items: ageRangeList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Qual a sua escolaridade?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: schoolingSelected,
              iconSize: 24,
              isExpanded: true,
              hint: Text("Clique Aqui"),
              elevation: 16,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Selecione sua escolaridade";
                }
                return null;
              },
              autovalidate: true,
              style: TextStyle(color: Colors.black),
              onChanged: (String value) {
                setState(() {
                  schoolingSelected = value;
                });
              },
              items:
                  schoolingList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Qual é a sua renda mensal familiar?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: familiarAverageSalarySelected,
              iconSize: 24,
              isExpanded: true,
              hint: Text("Clique Aqui"),
              elevation: 16,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Selecione sua escolaridade";
                }
                return null;
              },
              autovalidate: true,
              style: TextStyle(color: Colors.black),
              onChanged: (String value) {
                setState(() {
                  familiarAverageSalarySelected = value;
                });
              },
              items: familiarAverageSalaryList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ));
  }

  Widget page2() {
    return buildPage(
        pageIndex: 2,
        description:
            "Para que nossos direcionamentos sejam mais precisos necessitamos saber mais algumas informações suas",
        components: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Você pretende fazer um curso profissionalizante?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: doCourseSelected,
              iconSize: 24,
              isExpanded: true,
              hint: Text("Clique Aqui"),
              elevation: 16,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Selecione uma alternativa";
                }
                return null;
              },
              autovalidate: true,
              style: TextStyle(color: Colors.black),
              onChanged: (String value) {
                setState(() {
                  doCourseSelected = value;
                });
              },
              items: doCourseList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Quanto tempo por semana você teria disponível para se dedicar às atividades do app?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              value: activityTime,
              iconSize: 24,
              isExpanded: true,
              hint: Text("Clique Aqui"),
              elevation: 16,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Selecione sua escolaridade";
                }
                return null;
              },
              autovalidate: true,
              style: TextStyle(color: Colors.black),
              onChanged: (String value) {
                setState(() {
                  activityTime = value;
                });
              },
              items: timeToPlayActivitiesList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ));
  }

  Widget page3() {
    return buildPage(
        pageIndex: 3,
        description:
            "Para que nossos direcionamentos sejam mais precisos necessitamos saber mais algumas informações suas",
        components: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "O que você busca dentro do app?",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidate: true,
              enableInteractiveSelection: false,
              textInputAction: TextInputAction.done,
              controller: _textController,
              maxLength: 200,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Descreva o que você busca no app em 200 caracteres",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Preencha o campo";
                }
                return null;
              },
            )
          ],
        ));
  }

  List<Widget> buildPages(
    BuildContext context,
  ) {
    _pages = [page1(), page2(), page3()];
    return _pages;
  }

  Widget buildPage({
    @required String description,
    @required Widget components,
    @required int pageIndex,
    Widget option,
    List<String> suggestions,
  }) {
    List<Widget> generateSuggestions() {
      if (suggestions == null) return [];
      List<Widget> chips = [];
      for (String suggestion in suggestions) {
        chips.add(Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: suggestionsRemovable
              ? Chip(
                  label: Text(suggestion),
                  backgroundColor: Colors.white,
                  deleteIconColor: Colors.red,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  onDeleted: () {},
                )
              : ActionChip(
                  label: Text(suggestion),
                  backgroundColor: Colors.white,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    _textController.text = suggestion;
                  },
                ),
        ));
      }
      return chips;
    }

    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            description,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            textAlign: TextAlign.justify,
          ),
          if (suggestions != null && suggestions.length > 0)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: AnimationLimiter(
                    child: Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: AnimationConfiguration.toStaggeredList(
                          delay: Duration(milliseconds: 150),
                          duration: Duration(milliseconds: 200),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 70.0,
                            child: FadeInAnimation(
                              duration: Duration(milliseconds: 300),
                              child: widget,
                            ),
                          ),
                          children: generateSuggestions(),
                        ),
                      ),
                    ),
                  ),
                ),
                if (pageIndex != 1)
                  IconButton(
                      color: Theme.of(context).primaryColor,
                      icon: Icon(
                          suggestionsRemovable ? Icons.done_all : Icons.edit),
                      onPressed: () {
                        setState(() {
                          suggestionsRemovable = !suggestionsRemovable;
                        });
                      }),
              ],
            ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: <Widget>[
              Flexible(child: components),
              if (option != null) option,
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text(pageIndex == 0 ? "Cancelar" : "Voltar"),
                    onPressed: () {
                      if (pageIndex == 0)
                        Navigator.pop(context);
                      else
                        goBack();
                    },
                  ),
                  isRegisterPress == true
                      ? SpinKitThreeBounce(
                          color: Color(0xff34ccd3),
                          size: 40,
                        )
                      : pageIndex == 4
                          ? Container()
                          : RaisedButton(
                              child: Text(
                                  pageIndex == 3 ? 'Cadastrar' : "Próximo"),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  if (pageIndex == 3) {
                                    saveQuestionnaire();
                                  } else {
                                    goNext();
                                  }
                                }
                              },
                            )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          title: Text(
            "Queremos te Conhecer!",
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        body: Form(
          autovalidate: true,
          key: _formKey,
          child: Column(
            children: <Widget>[
              LinearProgressIndicator(
                  value: _formProgress,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor)),
              Expanded(
                child: PageView(
                    controller: _pageViewController,
                    physics: NeverScrollableScrollPhysics(),
                    children: buildPages(
                      context,
                    )),
              )
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
  }
}
