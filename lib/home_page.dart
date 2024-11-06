import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.email, required this.pass});
  TextEditingController email;
  TextEditingController pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text("Email: " +
                email.text.toString() +
                "\nPassword: " +
                pass.text.toString()),
          )
        ],
      ),
    );
  }
}
