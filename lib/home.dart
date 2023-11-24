import 'package:flutter/material.dart';
import 'package:saudeemmaos/remedios.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Color(0xFFEAF2FF),
      body: buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFEAF2FF),
      toolbarHeight: 100.0,
      title: buildAppBarTitle(),
      automaticallyImplyLeading: false,
    );
  }

  Row buildAppBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Olá, Mariana'),
        Row(
          children: [
            buildHapvidaButton(),
            SizedBox(width: 8.0),
            Icon(Icons.wb_sunny),
          ],
        ),
      ],
    );
  }

  Container buildHapvidaButton() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFF2F5FA),
          elevation: 0,
          onPrimary: Colors.blue,
        ),
        child: Text(
          'hapvida',
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildDateSelector(),
          SizedBox(height: 20.0),
          buildWaterGoalCard(),
          buildSummaryTitle('Resumo'),
          buildExamCard(),
          buildRecommendationsTitle('Recomendações'),
          buildRecommendationButtons(),
        ],
      ),
    );
  }

  Container buildDateSelector() {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      child: buildDateSelectorList(),
    );
  }

  ListView buildDateSelectorList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 31,
      itemBuilder: (context, index) {
        return buildDateSelectorItem(index);
      },
    );
  }

  Container buildDateSelectorItem(int index) {
    bool isToday = DateTime.now().day == index + 1;

    return Container(
      width: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: isToday ? Color(0xFF4385FF) : Colors.grey[300],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(
              color: isToday ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            getWeekday(index),
            style: TextStyle(
              fontSize: 10.0,
              color: isToday ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String getWeekday(int dayIndex) {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, dayIndex + 1);
    final weekday = date.weekday;
    final weekdays = [
      'Dom', 'Seg', 'Ter', 'Qua',
      'Qui', 'Sex', 'Sab'
    ];
    return weekdays[weekday - 1];
  }

  Stack buildWaterGoalCard() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 140,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              image: AssetImage('assets/images/card-1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 20.0,
          child: Text(
            'Faltam 500ml para meta diária',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }

  Container buildSummaryTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Card buildExamCard() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListTile(
        title: buildExamTitle(),
        subtitle: buildExamSubtitle(),
      ),
    );
  }

  Column buildExamTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Exame',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  Column buildExamSubtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildExamSubtitleText('Hemograma: Hemácias em milhões - 6,12'),
        buildExamSubtitleText('Eritrograma: Hemoglobina - 15,1'),
        buildExamSubtitleText('Valores Obtidos: Hematócrito - 44,8'),
        buildExamSubtitleText('RDW: 13,6'),
      ],
    );
  }

  Padding buildExamSubtitleText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(text),
    );
  }

  Container buildRecommendationsTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }

  Container buildRecommendationButtons() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5.0,
        children: [
          buildRecommendationButton('Alimentos', Icons.food_bank),
          buildRecommendationButton('Remédios', Icons.medication),
          buildRecommendationButton('Exames', Icons.document_scanner),
        ],
      ),
    );
  }

  ElevatedButton buildRecommendationButton(String title, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        if (title == 'Remédios') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RemediosPage()),
          );
        } else {
          // Lógica para lidar com o botão de recomendação
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFFFA04A),
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        minimumSize: Size(110.0, 90.0),
      ),
      child: Column(
        children: [
          Icon(icon),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        _showOptionsModal(context);
      },
      child: Icon(Icons.add),
      backgroundColor: Color(0xFF4385FF),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xFFEAF2FF),
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });

        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => JogosScreen()),
          );
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.games),
          label: 'Play',
        ),
      ],
    );
  }

  void _showOptionsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildModalOption('Adicionar dispositivo', Icons.alarm),
            buildModalOption('Adicionar profissional', Icons.calendar_today),
            buildModalOption('Nova consulta', Icons.edit),
          ],
        );
      },
    );
  }

  ListTile buildModalOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}

class JogosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogos'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Center(
        child: Text('Conteúdo da tela de jogos'),
      ),
    );
  }
}
