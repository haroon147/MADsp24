import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seup_pro/FirebaseServices/auth_service.dart';
import 'package:flutter_seup_pro/Firebase_Crud/Mainfile.dart';
import 'package:flutter_seup_pro/Homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseServices _auth = FirebaseServices();

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
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
                  padding: EdgeInsets.only(left: 20, top: 200),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "SignUpPage",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                      ),
                      child: TextFormField(
                        controller: _emailcontroller,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "Email",
                          fillColor: Colors.blueGrey,
                          border: InputBorder.none,
                          filled: true,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                      ),
                      child: TextFormField(
                        controller: _passwordcontroller,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "Password",
                          fillColor: Colors.blueGrey,
                          border: InputBorder.none,
                          filled: true,
                        ),
                      ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async{
                    String email = _emailcontroller.text;
                    String password = _passwordcontroller.text;

                    User? user = await _auth.signInMethod(email, password);
                    if(user!= null){
                      print("User is Signed In");
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> Homepage()));
                    }

                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                    ),
                    child: Center(
                      child: Text("Login"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text('Dont hava a account', style: TextStyle(
                        fontSize: 20
                      ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: GestureDetector(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (_)=>MyHomePage(),),);
                        },
                        child: Text('signUp', style: TextStyle(
                          fontWeight: FontWeight.bold,
                            fontSize: 20,color: Colors.blue
                        ),
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
