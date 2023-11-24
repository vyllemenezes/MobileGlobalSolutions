import 'package:flutter/material.dart';
import 'package:saudeemmaos/login_google.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PerfilPage(),
    );
  }
}

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
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
          value: 0.4,
        ),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(),
        buildProfileCard(),
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

  Widget buildProfileCard() {
    return Card(
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Colors.blue),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/hapvida-logo.png",
              height: 50,
              width: 150,
            ),
            SizedBox(height: 16.0),
            buildProfileInfo('Código', 'Matrícula'),
            buildProfileInfo('Nome', 'Eduarda Silva'),
            buildProfileInfo('Empresa', 'INDIVIDUAL'),
            buildProfileInfo('Adesão', '18/12/2007'),
            buildProfileInfo('Carência', '18/12/2007'),
            buildProfileInfo('Nascimento', '08/11/1985'),
            buildProfileInfo('Tipo de Plano', 'AMB+HOSP.S'),
          ],
        ),
      ),
    );
  }

  Widget buildProfileInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget buildNextButton() {
    return Container(
      margin: EdgeInsets.all(16.0),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginGooglePage()));
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFD9E7FF),
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 20),
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
