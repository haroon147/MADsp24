import 'package:flutter/material.dart';
import 'package:flutter_seup_pro/Firebase_Crud/Mainfile.dart';
import 'package:flutter_seup_pro/Firestore/FirestoreListScreen.dart';
import 'package:flutter_seup_pro/SignUp.dart';
import 'package:flutter_seup_pro/login.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => FireStoreScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Lottie.network(
              "https://lottie.host/04083049-6b52-4bb0-997e-bb1662f86d25/n6R6sSLeQ6.json"),
        ),
      ),
    );
  }
}
