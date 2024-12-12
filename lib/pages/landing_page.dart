import 'package:flutter/material.dart';
import 'package:flutter_news/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          children: [
            Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "images/landing.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.7,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "News from around the\n      world for you",
              style: TextStyle(color: Colors.black, fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Best time to read, take your time to read\n        a little more of this world",
              style: TextStyle(color: Colors.black45, fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 40.0),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 3.0,
                child: InkWell(
                  onTap: () async {
                    final instance = await SharedPreferences.getInstance();
                    final isLogin = instance.getBool("isLogin");
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (isLogin ?? false) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
