import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class ResetPage extends StatelessWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _resetPage(),
    );
  }
}

class _resetPage extends StatefulWidget {
  const _resetPage({Key? key}) : super(key: key);

  @override
  State<_resetPage> createState() => _resetPageState();
}

class _resetPageState extends State<_resetPage> {
  TextEditingController _emailTextController = TextEditingController();

  Future reset() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailTextController.text)
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  void dispose() {
    _emailTextController.text;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("reset password "),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          icon:Icon( Icons.arrow_back),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, bottom:50),
                child: TextField(
                  controller: _emailTextController,
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed:reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Send Message',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
