import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class intro extends StatefulWidget {
  const intro({super.key});

  @override
  State<intro> createState() => _introState();
}

class _introState extends State<intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            image: FlutterLogo(
              size: 150,
            ),
            title: "first page",
          ),
          PageViewModel(
            image: FlutterLogo(
              size: 150,
            ),
            title: "second page",
          ),
          PageViewModel(
            image: FlutterLogo(
              size: 150,
            ),
            title: "third page",
          ),
          PageViewModel(
            image: FlutterLogo(
              size: 150,
            ),
            title: "fourth page",
          ),
          PageViewModel(
            image: FlutterLogo(
              size: 150,
            ),
            title: "fifth page",
          ),
        ],
      ),
    );
  }
}
