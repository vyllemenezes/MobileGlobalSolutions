import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remédios App',
      home: RemediosPage(),
    );
  }
}

class RemediosPage extends StatefulWidget {
  @override
  _RemediosPageState createState() => _RemediosPageState();
}

class _RemediosPageState extends State<RemediosPage> {
  List<Map<String, dynamic>> remedios = [];
  List<bool> switchValues = [];

  @override
  void initState() {
    super.initState();
    _carregarDadosDaApi();
  }

  Future<void> _carregarDadosDaApi() async {
    final url = 'http://10.0.2.2:8080/prescriptions';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> dados =
        List<Map<String, dynamic>>.from(json.decode(response.body));
        setState(() {
          remedios = dados;
          switchValues = List<bool>.generate(remedios.length, (index) {
            return false;
          });
          _loadSwitchValues();
        });
      } else {
        throw Exception('Falha ao carregar dados da API');
      }
    } catch (e) {
      print('Erro na requisição: $e');
    }
  }

  Future<void> _loadSwitchValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      switchValues = List<bool>.generate(remedios.length, (index) {
        return prefs.getBool('${remedios[index]['id']}') ?? false;
      });
    });
  }

  Future<void> _saveRemedio(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedIds = prefs.getStringList('selectedRemedios') ?? [];
    savedIds.add(remedios[index]['id'].toString());
    prefs.setStringList('selectedRemedios', savedIds);
  }

  Future<void> _saveAllRemedios() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedIds = [];
    for (int i = 0; i < switchValues.length; i++) {
      if (switchValues[i]) {
        savedIds.add(remedios[i]['id'].toString());
      }
    }
    prefs.setStringList('selectedRemedios', savedIds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remédios'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedRemediosPage(remedios: remedios),
                ),
              );
            },
          ),
        ],
      ),
      body: _buildListaRemedios(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveAllRemedios();
        },
        child: Icon(Icons.save),
      ),
    );
  }

  Widget _buildListaRemedios() {
    if (remedios.isEmpty) {
      return Center(
        child: Text('Nenhum remédio encontrado.'),
      );
    } else {
      return ListView.builder(
        itemCount: remedios.length,
        itemBuilder: (context, index) {
          final remedio = remedios[index];
          final switchValue = switchValues.length > index ? switchValues[index] : false;

          return Card(
            color: switchValue ? Color(0xFF4385FF) : null,
            child: ListTile(
              title: Text(remedio['medicament']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Diagnóstico: ${remedio['diagnostic']}'),
                  Text('Dosagem: ${remedio['dosage']}'),
                  Text('Frequência: ${remedio['frequency']}'),
                  Text('Medicamento: ${remedio['medicament']}'),
                ],
              ),
              trailing: Checkbox(
                value: switchValue,
                onChanged: (bool? value) {
                  setState(() {
                    switchValues[index] = value ?? false;
                    if (value ?? false) {
                      _saveRemedio(index);
                    }
                  });
                },
              ),
            ),
          );
        },
      );
    }
  }
}

class SavedRemediosPage extends StatefulWidget {
  final List<Map<String, dynamic>> remedios;

  SavedRemediosPage({required this.remedios});

  @override
  _SavedRemediosPageState createState() => _SavedRemediosPageState();
}

class _SavedRemediosPageState extends State<SavedRemediosPage> {
  List<Map<String, dynamic>> savedRemedios = [];

  @override
  void initState() {
    super.initState();
    _loadSavedRemedios();
  }

  Future<void> _loadSavedRemedios() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedIds = prefs.getStringList('selectedRemedios') ?? [];

    setState(() {
      savedRemedios = widget.remedios
          .where((remedio) => savedIds.contains(remedio['id'].toString()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remédios Salvos'),
      ),
      body: _buildSavedRemedios(),
    );
  }

  Widget _buildSavedRemedios() {
    if (savedRemedios.isEmpty) {
      return Center(
        child: Text('Nenhum remédio salvo.'),
      );
    } else {
      return ListView.builder(
        itemCount: savedRemedios.length,
        itemBuilder: (context, index) {
          final remedio = savedRemedios[index];

          return Card(
            child: ListTile(
              title: Text(remedio['medicament']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Diagnóstico: ${remedio['diagnostic']}'),
                  Text('Dosagem: ${remedio['dosage']}'),
                  Text('Frequência: ${remedio['frequency']}'),
                  Text('Medicamento: ${remedio['medicament']}'),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
