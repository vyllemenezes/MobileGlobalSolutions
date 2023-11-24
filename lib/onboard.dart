import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageViewScreen(),
    );
  }
}

class PageViewScreen extends StatefulWidget {
  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: Color(0xFFEAF2FF),
      actions: [
        if (_currentPage < 2)
          buildSkipButton(),
      ],
    );
  }

  Widget buildBody() {
    return Container(
      color: Color(0xFFEAF2FF),
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          PageWidget(
            image: 'assets/images/onboarding-1.png',
            description: 'Receba prescrições médicas diretamente no seu dispositivo.',
            title: 'Prescrições',
          ),
          PageWidget(
            image: 'assets/images/onboarding-2.png',
            description:
            'Registre diariamente sintomas, níveis de energia, humor e qualidade do sono.',
            title: 'Registro',
          ),
          PageWidget(
            image: 'assets/images/onboarding-3.png',
            description:
            'Um espaço dedicado para recomendações médicas além das prescrições.',
            isLastPage: true,
            title: 'Recomendações',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  BottomAppBar buildBottomNavigationBar() {
    return BottomAppBar(
      height: 100,
      elevation: 0,
      color: Color(0xFFEAF2FF),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (_currentPage > 0) buildBackButton(),
            buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget buildSkipButton() {
    return Container(
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Pular',
            style: TextStyle(
              color: Color(0xFF4385FF),
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBackButton() {
    return ElevatedButton(
      onPressed: () {
        if (_currentPage > 0) {
          _pageController.previousPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
        side: BorderSide.none,
      ),
      child: Text(
        'Voltar',
        style: TextStyle(
          color: Color(0xFF212529),
          fontFamily: 'Raleway',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildNextButton() {
    return ElevatedButton(
      onPressed: () {
        if (_currentPage < 2) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        elevation: 0,
        side: BorderSide(color: Color(0xFF212529), width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _currentPage == 2 ? 'Começar' : 'Próximo',
            style: TextStyle(
              color: Color(0xFF4385FF),
              fontFamily: 'Raleway',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 5),
          Icon(Icons.arrow_forward, color: Color(0xFF4385FF)),
        ],
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  final String image;
  final String description;
  final String title;
  final bool isLastPage;
  final VoidCallback? onPressed;

  PageWidget({
    required this.image,
    required this.description,
    required this.title,
    this.isLastPage = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 400,
            width: 400,
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, fontFamily: 'Raleway'),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamily: 'Raleway'),
          ),
        ],
      ),
    );
  }
}
