import 'package:flutter/material.dart';
import 'package:saudeemmaos/cadastro.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Color(0xFFEAF2FF),
        ),
        backgroundColor: Color(0xFFEAF2FF),
        body: LoginBody(),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LogoWidget(),
            WelcomeText(),
            CreateProfileButton(),
            GoogleSignInButton(),
          ],
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Image.asset(
        'assets/images/icon-android.png',
        height: 150,
        width: 150,
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          'Boas vindas!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            fontFamily: 'Raleway',
          ),
        ),
      ),
    );
  }
}

class CreateProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 30, right: 30),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CadastroPage()));
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF4385FF),
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            side: BorderSide(color: Colors.black),
          ),
          child: Text(
            'Criar Perfil',
            style: TextStyle(fontSize: 18, color: Color(0xFF4385FF)),
          ),
        ),
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 30, right: 30),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () {
            print('Entrar com o Google');
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF4385FF),
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            side: BorderSide(color: Colors.black),
          ),
          icon: Image.asset('assets/images/google-icon.png', height: 24, width: 24),
          label: Text(
            'Entrar com o Google',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
