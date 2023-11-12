// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

const String content1 = 'You Love Jabed';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.amberAccent[100]),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomePage(),
        '/about': (context) => const AboutUsPage(),
        '/jabed': (context) => const ContentPage(content1),
        '/sanjay': (context) => const ContentPage('You Love Sanjay'),
        '/avik': (context) => const ContentPage('You Love Avik'),
        '/pankaj': (context) => const ContentPage('You Love Pankaj'),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/MyImage.png'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.yellow[300],
        elevation: 10.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton('Jabed', Icons.account_circle_outlined, '/jabed'),
                CustomButton(
                    'Sanjay', Icons.account_circle_outlined, '/sanjay'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton('Avik', Icons.account_circle_outlined, '/avik'),
                CustomButton(
                    'Pankaj', Icons.account_circle_outlined, '/pankaj'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to About Us page
          Navigator.pushNamed(context, '/about');
        },
        child: const Icon(Icons.phone),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('About Us Page Content'),
      ),
    );
  }
}

class ContentPage extends StatelessWidget {
  final String content;

  const ContentPage(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Content'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Text(content),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final IconData iconData;
  final String route;

  const CustomButton(this.buttonText, this.iconData, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      height: 150.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevetedButton.styleFrom(
            primary: Colors.green[300],
            onPrimary: Colors.yellow[300],
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconData,
              size: 50.0,
            ),
            Text(
              buttonText,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ElevetedButton {
  static styleFrom(
      {Color? primary,
      Color? onPrimary,
      required double elevation,
      required RoundedRectangleBorder shape}) {}
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        width: 125.0, // Set the desired width for the entire drawer
        child: Column(
          children: [
            Container(
              height: 80.0, // Set the desired height for the DrawerHeader
              color: Colors.blue, // Set the desired color for the DrawerHeader
              child: const Center(
                child: Text(
                  'App Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              selectedColor: Colors.blue,
              onTap: () {
                Navigator.popAndPushNamed(context, '/home');
              },
            ),
            ListTile(
              title: const Text('Jabed'),
              selectedColor: Colors.blue,
              onTap: () {
                Navigator.popAndPushNamed(context, '/jabed');
              },
            ),
            ListTile(
              title: const Text('Sanjay'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/sanjay');
              },
            ),
            ListTile(
              title: const Text('Avik'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/avik');
              },
            ),
            ListTile(
              title: const Text('Pankaj'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/pankaj');
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}
