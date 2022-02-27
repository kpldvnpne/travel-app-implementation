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
        fontFamily: 'WorkSans',
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
    const horizontalPadding = 20.0;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Header(),
                  SizedBox(height: 40),
                  Search(),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: horizontalPadding),
              child: Locations(),
            ),
            const SizedBox(height: 34),
            const BestDestination(padding: horizontalPadding),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Recommended(),
            )
          ],
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
          LocationsItem(
            name: 'Bali',
            isActive: true,
          ),
          LocationsItem(name: 'Jakarta'),
          LocationsItem(name: 'Bandung'),
          LocationsItem(name: 'Surabay'),
          LocationsItem(name: 'Malta'),
        ],
      ),
    );
  }
}

class LocationsItem extends StatelessWidget {
  final String name;
  final bool isActive;

  const LocationsItem({
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

class BestDestination extends StatelessWidget {
  final double padding;

  const BestDestination({Key? key, required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: const SectionTitle('Best Destination'),
        ),
        const SizedBox(height: 25),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                BestDestinationCard(
                  name: 'Bulkit Raya',
                  location: 'Indonesia, Bali',
                  rating: 4.8,
                ),
                BestDestinationCard(
                  name: 'Gunung Anung',
                  location: 'Indonesia Bali',
                  rating: 3.5,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Text(
          'View All',
          style: TextStyle(
            color: greyColor,
            fontSize: 13,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    );
  }
}

class BestDestinationCard extends StatelessWidget {
  final String name;
  final String location;
  final double rating;

  const BestDestinationCard(
      {Key? key,
      required this.name,
      required this.location,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 210,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(9),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: 184,
            height: 134,
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Location(location),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: themeColor3,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: themeColor,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(
                        color: themeColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location(
    this.location, {
    Key? key,
  }) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.location_pin,
          size: 16,
          color: greyColor,
        ),
        Text(
          location,
          style: const TextStyle(
            fontSize: 11,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}

class Recommended extends StatelessWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle('Recommended'),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(13),
          ),
          padding: const EdgeInsets.all(7),
          child: Row(
            children: [
              Container(
                width: 65,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: themeColor2,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          '12 km',
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 10,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: greyColor,
                          ),
                        ),
                        Text(
                          '1 h 30 min',
                          style: TextStyle(
                            color: greyColor,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'Pantal Nusa Penida',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Location('Indonesia, Bali'),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      '\$20',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
