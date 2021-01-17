import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:owe/owe/presentation/pages/questionnaire/questionnaire_page.dart';
import 'package:owe/owe/utils/color_theme.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => QuestionnairePage()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/onboarding/$assetName.png', width: 250.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Explores suas possibilidades",
          body: "DESCRIÇÃO",
          image: _buildImage('onboarding_page1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Descubra novas perspectivas",
          body: "DESCRIÇÃO",
          image: _buildImage('onboarding_page2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Defina seus objetivos",
          body: "DESCRIÇÃO",
          image: _buildImage('onboarding_page3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Compreenda o seu projeto de vida",
          body: "DESCRIÇÃO",
          image: _buildImage('onboarding_page4'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Pular'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Vamos lá',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: ColorThemeApp.secondColor)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: ColorThemeApp.primaryColor,
        activeSize: Size(22.0, 10.0),
        activeColor: ColorThemeApp.secondColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
