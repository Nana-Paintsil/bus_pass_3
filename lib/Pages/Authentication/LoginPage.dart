import 'package:bus_pass_3/Models/Scoped_Model.dart';
import 'package:bus_pass_3/Pages/Main_Pages/CreateUser.dart';
import 'package:bus_pass_3/api.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../Widgets/ErrorDialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isBusy = false;
  bool activatedOnce = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/main_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: activatedOnce == false
                        ? AutovalidateMode.disabled
                        : AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 200,
                            child: Image(
                                image: AssetImage("assets/images/bus.png"))),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Sign In",
                              style: TextStyle(fontSize: 22),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Enter your details to get started",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail_outline_outlined),
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outlined),
                            //   suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              activatedOnce = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isBusy = true;
                              });
                              try {
                                await ScopedModel.of<MyScopedModel>(context)
                                    .authenticateThenNavigate(
                                        UserCred(
                                            email: _emailController.text,
                                            password: _passwordController.text),
                                        context)
                                    .then((value) {
                                  if (value == true) {
                                    setState(() {
                                      isBusy = false;
                                    });
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          ErrorDialog(
                                        message: 'Invalid Username or Password',
                                      ),
                                    ).then((value) {
                                      setState(() {
                                        isBusy = false;
                                      });
                                    });
                                  }
                                });
                              } catch (ex) {}
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade400,
                            // Add other styling properties here
                          ),
                          child: Container(
                            width: double
                                .infinity, // Button reaches the end of the screen
                            padding: EdgeInsets.symmetric(
                                vertical: 15), // Increased padding
                            child: Center(
                                child: isBusy == false
                                    ? Container(
                                        height: 30,
                                        padding: EdgeInsets.all(3),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(fontSize: 18),
                                        ))
                                    : SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          color: Colors.white,
                                        )),
                                      )),
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(fontSize: 18),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            CreateAccountPage())));
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }
}
