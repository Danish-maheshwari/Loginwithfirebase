import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/home_page.dart';
import 'package:login_page/sign_up.dart';

class Login_page extends StatelessWidget {
  Login_page({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void GoHomePage(BuildContext context) {
    if (_key.currentState!.validate()) {
      SignIn(_email.text, _password.text);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              email: _email,
              pass: _password,
            ),
          ));
    }
  }

  void SignIn(String Email, String Password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signInWithEmailAndPassword(email: Email, password: Password);
    } on FirebaseAuthException catch (Error) {
      print("Errrrrrr: " + Error.toString());
    }
  }

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:
            false, //email ya pass me keyad upar ati hai to some time size ka masla ata hai to wo ase solve hota hai
        backgroundColor: const Color.fromARGB(255, 205, 102, 102),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Row(
                children: [
                  Text(
                    "ImmDr",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.water_drop_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    "ps",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 468,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, -10),
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 25)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, left: 30),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 20)),
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: TextFormField(
                                  controller: _email,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Email";
                                    } else if (!value.contains("@gmail.com")) {
                                      return "Please Enter the valid gmail";
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: "Enter your Email",
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey
                                                  .withOpacity(0.6))))),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text("Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 20)),
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: TextFormField(
                                controller: _password,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Password";
                                  } else if (value.length < 6) {
                                    return "Password is less than 6";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter your password",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.grey.withOpacity(0.6)))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ,))
                      },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoHomePage(context);
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                          width: 1200,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 205, 102, 102),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Sign_up(),
                                  ));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 205, 102, 102)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 500,
                            color: Colors.grey.withOpacity(0.6),
                          ),
                          Text(
                            " OR ",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 205, 102, 102)),
                          ),
                          Container(
                            height: 1,
                            width: 500,
                            color: Colors.grey.withOpacity(0.6),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              child: Icon(
                                Icons.facebook,
                                color: Colors.white,
                              ),
                              width: 40,
                              height: 40,
                              color: const Color.fromARGB(255, 5, 1, 1),
                            ),
                          ),
                          SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              child: Icon(
                                Icons.g_mobiledata,
                                color: Colors.white,
                              ),
                              width: 40,
                              height: 40,
                              color: const Color.fromARGB(255, 5, 1, 1),
                            ),
                          ),
                          SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              child: Icon(
                                Icons.snapchat,
                                color: Colors.white,
                              ),
                              width: 40,
                              height: 40,
                              color: const Color.fromARGB(255, 5, 1, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
