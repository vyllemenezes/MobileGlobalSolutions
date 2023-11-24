import 'package:flutter/material.dart';
import 'package:saudeemmaos/home.dart';

class Finish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox.shrink(),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20.0),
            child: LinearProgressIndicator(
              backgroundColor: Color(0xFFEAF2FF),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              value: 1.0,
            ),
          ),
        ),
        backgroundColor: Color(0xFFEAF2FF),
        body: FinishBody(),
      ),
    );
  }
}

class FinishBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FinishHeader(),
        FinishContent(),
        FinishImage(),
        Spacer(),
        FinishButton(),
      ],
    );
  }
}

class FinishHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 16.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class FinishContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hora de começar!',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 24.0,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Você pode terminar de configurar seu perfil depois.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}

class FinishImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Image.asset(
          'assets/images/finish-image.png',
          width: 350.0,
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FinishButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFD9E7FF),
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          'Começar',
          style: TextStyle(color: Color(0xFF4385FF)),
        ),
      ),
    );
  }
}
