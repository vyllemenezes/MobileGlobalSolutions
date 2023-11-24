import 'package:flutter/material.dart';

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
                  builder: (context) => SavedRemediosPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: RemedioList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class RemedioList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Nenhum remédio encontrado.'),
    );
  }
}

class SavedRemediosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remédios Salvos'),
      ),
      body: SavedRemediosList(),
    );
  }
}

class SavedRemediosList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Nenhum remédio salvo.'),
    );
  }
}

