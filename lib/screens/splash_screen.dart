import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/Homepage/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/movies.png"),
                  height: 200,
                  width: 350,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Watch Movies",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: AutofillHints.addressState,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                CupertinoActivityIndicator(
                  color: Colors.grey.shade800,
                  radius: 12,
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("powered by"),
                SizedBox(width: 4),
                Text("Pasindu"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
