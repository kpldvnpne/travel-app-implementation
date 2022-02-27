import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const themeColor = Color(0xFFFA9E52);
const themeColor2 = Color(0xFFFFE3AB);
const themeColor3 = Color(0xFFFEF7F0);
const backGroundColor = Color(0xFFFCFCFC);
const greyColor = Color(0xFFD1A5A5);
const whiteColor = Color(0xFFFFFFFF);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              Header(),
              SizedBox(height: 40),
              Search(),
              SizedBox(height: 30),
              Locations(),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: themeColor2,
          radius: 40,
          child: null,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: greyColor),
                ),
                SizedBox(height: 10),
                Text(
                  'Christina Amanda',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: themeColor3,
          radius: 25,
          child: Stack(
            children: const [
              Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
              Positioned(
                right: 5,
                top: 5,
                child: CircleAvatar(
                  backgroundColor: themeColor,
                  child: null,
                  radius: 3,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        color: whiteColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 26),
              child: Text(
                'Search for places...',
                style: TextStyle(
                  color: greyColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: themeColor,
              child: Icon(
                Icons.search,
                color: whiteColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Locations extends StatelessWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Location(
            name: 'Bali',
            isActive: true,
          ),
          Location(name: 'Jakarta'),
          Location(name: 'Bandung'),
          Location(name: 'Surabay'),
          Location(name: 'Malta'),
        ],
      ),
    );
  }
}

class Location extends StatelessWidget {
  final String name;
  final bool isActive;

  const Location({
    Key? key,
    required this.name,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              color: isActive ? themeColor : greyColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          if (isActive)
            Container(
              width: 17,
              height: 3,
              color: themeColor,
            )
        ],
      ),
    );
  }
}
