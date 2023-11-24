import 'package:flutter/material.dart';
import 'package:saudeemmaos/finish.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginGooglePage(),
    );
  }
}

class LoginGooglePage extends StatefulWidget {
  @override
  _LoginGooglePageState createState() => _LoginGooglePageState();
}

class _LoginGooglePageState extends State<LoginGooglePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Color(0xFFEAF2FF),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: SizedBox.shrink(),
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20.0),
        child: LinearProgressIndicator(
          backgroundColor: Color(0xFFEAF2FF),
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          value: 0.6,
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(),
        buildLoginWithGoogleButton(),
        Spacer(),
        buildNextButton(),
      ],
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 16.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget buildLoginWithGoogleButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        child: LoginWithGoogleButton(),
      ),
    );
  }

  Widget buildNextButton() {
    return Container(
      margin: EdgeInsets.all(16.0),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Finish()));
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFD9E7FF),
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 20),
          side: BorderSide(color: Colors.transparent),
        ),
        label: Text(
          'Próximo',
          style: TextStyle(color: Color(0xFF4385FF)),
        ),
        icon: Icon(Icons.arrow_forward, color: Color(0xFF4385FF)),
      ),
    );
  }
}

class LoginWithGoogleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        print('Entrar com o Google');
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Color(0xFF4385FF),
        side: BorderSide(color: Colors.blue),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      ),
      icon: Image.asset('assets/images/google-icon.png', height: 24, width: 24),
      label: Text(
        'Entrar com o Google',
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
