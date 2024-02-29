import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seup_pro/SplashScreen.dart';
import 'firebase_options.dart';

void main() async{ //main function should be async because sometimes it take time.
  WidgetsFlutterBinding.ensureInitialized(); // initialize the instance
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   //Defaultfirebase.current platform is used for initialization to your current
  //platform
  if(kIsWeb){ //this code is used when you have to initialize for web
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey:  "AIzaSyCUdMSQE_2ALg0IA-cYlK2P2t_zbcLp4fA",
          appId:"1:954529334536:web:2e43333bde07162d5b58bd",
          messagingSenderId:"954529334536",
          projectId: "flutterpro-84109")
     );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );}
}
