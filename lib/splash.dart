import 'package:flutter/material.dart';
import 'onboard.dart';

void main() {
  runApp(Splash());
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          color: Color(0xFFEAF2FF),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AppLogo(),
              AppTitle(),
              AppBy(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 270.0),
      child: Image.asset(
        "assets/images/icon-splash.png",
        height: 150,
        width: 150,
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Saúde em Mãos",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'PTSans',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class AppBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      child: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: 'by ',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 14.0,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'hapvida',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 14.0,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
