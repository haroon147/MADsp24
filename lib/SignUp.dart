import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seup_pro/FirebaseServices/auth_service.dart';
import 'package:flutter_seup_pro/Homepage.dart';
import 'package:flutter_seup_pro/login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseServices _auth = FirebaseServices();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/pic.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 200),
                  child: const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Username",
                          fillColor: Colors.blueGrey,
                          border: InputBorder.none,
                          filled: true,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Email",
                          fillColor: Colors.blueGrey,
                          border: InputBorder.none,
                          filled: true,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black38,
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Password",
                        fillColor: Colors.blueGrey,
                        border: InputBorder.none,
                        filled: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 100),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.brown,
                  ),
                  child: Center(
                    child: GestureDetector(
                        onTap: () async {
                          String name = _usernameController.text;
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          User? user = await _auth.signUpMethod(email, password);
                          //created user instance in that file and assign email and password
                          //to those fields.
            
                          if (user != null) { // if used email value is not null
                            // then created user and navigate it to homepage
                            print("User is sucessfully created");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => Homepage()), //homepage path
                            );
                          }
                        },
                        child: Text("Signuppage")),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Text(
                        'Already Have a Account',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          'loginPage',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
