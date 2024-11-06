import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_page/login.dart';

class Sign_up extends StatelessWidget {
  Sign_up({super.key});
  final GlobalKey<FormState> keys = GlobalKey<FormState>();
  void SignUp(String Email, String Password) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: Email, password: Password);
    } on FirebaseAuthException catch (Error) {
      print("Errrrrrr: " + Error.toString());
    }
  }

  String? validate(value) {
    if (value!.isEmpty) {
      return "Please Enter Password";
    } else if (value.length < 3) {
      return "Password is less than 3";
    }
    return null;
  }

  void GoLoginPage(BuildContext context) {
    if (keys.currentState!.validate()) {
      SignUp(_email.text, _password.text);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login_page(),
          ));
    }
  }

  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();

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
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: keys,
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
                                      return "enter the value";
                                    } else if (!value.contains("@gmail.com")) {
                                      return "Enter the proper email";
                                    }
                                    return null;
                                  },
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
                                validator: validate,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter your password",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.grey.withOpacity(0.6)))),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // Text("Confirm Password",
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.w400, fontSize: 20)),
                            // Padding(
                            //   padding: const EdgeInsets.only(right: 50),
                            //   child: TextFormField(
                            //     validator: (value1) {
                            //       if (value1 != _password.text) {
                            //         return "not match";
                            //       }
                            //       return null;
                            //     },
                            //     obscureText: true,
                            //     decoration: InputDecoration(
                            //         hintText: "Enter your password",
                            //         enabledBorder: UnderlineInputBorder(
                            //             borderSide: BorderSide(
                            //                 color:
                            //                     Colors.grey.withOpacity(0.6)))),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoLoginPage(context);
                        },
                        child: Container(
                          child: Center(
                              child: Text(
                            "Sign Up",
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
                          Text("Already have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login_page(),
                                  ));
                            },
                            child: Text(
                              "Sign In",
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
