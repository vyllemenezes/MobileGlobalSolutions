import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:saudeemmaos/login.dart';
import 'package:saudeemmaos/perfil_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CadastroPage(),
    );
  }
}

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _cpfController = TextEditingController();
  final _cpfMaskFormatter = MaskTextInputFormatter(mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    super.initState();
    _loadCPF(); // Carrega o CPF salvo ao iniciar a tela
  }

  _loadCPF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cpf = prefs.getString('cpf') ?? '';
    setState(() {
      _cpfController.text = cpf;
    });
  }

  _saveCPF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cpf', _cpfController.text);
  }

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
      title: SizedBox.shrink(), // Título vazio para evitar duplicação com o LinearProgressIndicator
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20.0),
        child: LinearProgressIndicator(
          backgroundColor: Color(0xFFEAF2FF),
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          value: 0.2,
        ),
      ),
    );
  }


  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(),
        buildCPFInput(),
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
              _saveCPF(); // Salva o CPF ao sair da tela
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget buildCPFInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.blue),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: _cpfController,
            inputFormatters: [_cpfMaskFormatter],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'CPF',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNextButton() {
    return Container(
      margin: EdgeInsets.all(16.0),
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          _saveCPF(); // Salva o CPF ao pressionar o botão
          Navigator.push(context, MaterialPageRoute(builder: (context) => PerfilPage()));
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
